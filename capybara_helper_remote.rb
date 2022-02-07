require "capybara/rspec"
require "capybara-screenshot/rspec"
require "webdrivers"
#require "byebug"
#require "faker"
require "spec_helper"

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  "screenshot_#{example.description.gsub(" ","-").gsub(/^.*\/spec\//, "")}"
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :remote_browser do |app|
  url = ENV.fetch("REMOTE_HOST", "http://localhost:4444/wd/hub/")
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome

  Capybara::Selenium::Driver.new(
    app,
    :browser => :remote,
    url: url,
    desired_capabilities: capabilities
  )
end

Capybara::Screenshot.register_driver(:remote_browser) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = Selenium::WebDriver::Chrome::Options.new
  browser_options.add_argument("--headless")
  browser_options.add_argument("--disable-gpu")
  browser_options.add_argument("--no-sandbox")
  browser_options.add_argument("--disable-dev-shm-usage")
  browser_options.add_argument("--window-size=1366,768")
  # Because the application has a browser version check we need to spoof the user agent
  browser_options.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36")
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

Capybara.run_server = false
Capybara.default_max_wait_time = 15
$wait_time_long = 20
$wait_time_longer = 30
$wait_time_longest = 50
$wait_time_forever = 60
Capybara.save_path = File.join(Dir.pwd, "screenshots")
Capybara.default_driver = ENV["CAPYBARA_HEADLESS"] ? :selenium_chrome_headless : :chrome
Capybara.default_driver = ENV["REMOTE_HOST"] ? :remote_browser : Capybara.default_driver
Capybara.app_host = ENV.fetch("TEST_APP_HOST", "https://app.qa.litera.work")

# Maximize the window to avoid resolution issues and headless run issues
current_window_handle = Capybara.page.driver.current_window_handle
Capybara.page.driver.maximize_window(current_window_handle)
