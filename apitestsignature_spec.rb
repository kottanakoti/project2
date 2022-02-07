require 'capybara/rspec'
require "capybara_helper_remote"
require 'httparty'

describe "apitest process", type: :feature do
    scenario "API test" do 
        visit "https://app.eagleview.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click 
        find("[href='/deals']").click
        #find("[href='deals/2145/roles']").click
        #find("[data-test-id='nav-item-signatures']").click
        sleep 10
        #find("[data-test-id='nav-item-signatures']").click
        auth_cookie = get_authentication_cookie
        deal_id = 373
        signature_data = CreateSignatureGroup.new
        puts signature_data
        group_name = post_signature_group_in_signatures(deal_id, signature_data, auth_cookie)
        
    end
  end

  def get_authentication_cookie
    browser = Capybara.current_session.driver.browser.manage
    #byebug
    cookie_value = browser.cookie_named("authentication")[:value]
    jwt_token = (browser.cookie_named("jwtToken")[:value] rescue '')
    JSON.parse(CGI.unescape(cookie_value)).merge('jwt_token' => jwt_token)
  end

  


  def post_signature_group_in_signatures(deal_id, signature_data, auth_cookie)
    headers = {
      "x-user-token" => auth_cookie["token"],
      "AUTHORIZATION" => auth_cookie["jwt_token"],
      "x-user-email" => auth_cookie["email"],
      "x-entity-user-id" => auth_cookie["entity_user_id"].to_s,
      "Content-Type" => "application/json"
    }

    
    test_api_host = "https://api.eagleview.eupheme.tech"
    response = HTTParty.post(
      "#{test_api_host}/v1/deals/#{deal_id}/signature_groups?expand=deal.status",
      body: signature_data.as_json,
      headers: headers
    )

    expect(JSON.parse(response.body)["status"]).to eq(200)
    JSON.parse(response.body)["data"]
  end


  class CreateSignatureGroup 
    attr_accessor :signature_group 

    def initialize(options = {})
      @name = options.fetch(:signature_group, "name #{Time.now.to_i}")
    end

    def as_json
      {
        name: @name
      }.to_json
    end
  end


  