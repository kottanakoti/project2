require 'capybara/rspec'
require "capybara_helper_remote"

describe "the signin process", type: :feature do
  scenario "siging" do
    visit  "https://app.eagleview.eupheme.tech/"
    find("#input-email").set("Ramakrishna.samineni+test1@qualitlabs.com")
    find("#input-password").set("QualiT@7890")
    find("[type~=submit]").click
    

    expect(page). to have_css("[data-test-id~=nav-item-dms_settings]", text: "DMS", wait: 30)
    find(:xpath, '//a[@href="/deals"]', text: "Deals").click 
    find(:xpath, '//a[@id="create_deal_button"]', text: "Create Deal").click
    find(:xpath, '//div[@data-test-id="start-with-template"]').click 
    find(:xpath, '//div[@data-test-id="deal-type-5"]').click
    find(:xpath, '//div[@data-test-id="deal-template-2"]').click
    find(:xpath, '//button[@data-test-id="include-data-room-button-yes"]').click
    find(:xpath, '//button[@data-test-id="use-voting-threshold-button-yes"]').click 
    find(:xpath, '//button[@class="mdi mdi-arrow-right rounded  removal"]').click
    find(:xpath, '//*[text() = "Yes"]').click
    find(:xpath, '//input[@data-test-id="deal-name"]').set("RamakrishnaSamineni")
    find(:xpath, '//div[@data-test-id="modal-bottom-right-button"]').click
    find(:xpath, '//*[text() = "No. This can be enabled later."]').click
    find(:xpath, '//div[@data-test-id="modal-bottom-right-button"]').click
    find(:xpath, '//*[text() = "Set up your team"]').click
    find(:xpath, '//div[@data-test-id="deal-item-352"]').click 

  end
end

