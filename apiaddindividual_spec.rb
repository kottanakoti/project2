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
        signature_id = 214
        individual_data = CreateIndividualMember.new
        puts individual_data
        group_name = post_individual_signer(deal_id, signature_id, individual_data, auth_cookie)
        
    end
  end

  def get_authentication_cookie
    browser = Capybara.current_session.driver.browser.manage
    #byebug
    cookie_value = browser.cookie_named("authentication")[:value]
    jwt_token = (browser.cookie_named("jwtToken")[:value] rescue '')
    JSON.parse(CGI.unescape(cookie_value)).merge('jwt_token' => jwt_token)
  end

  


  def post_individual_signer(deal_id, signature_id, individual_data, auth_cookie)
    headers = {
      "x-user-token" => auth_cookie["token"],
      "AUTHORIZATION" => auth_cookie["jwt_token"],
      "x-user-email" => auth_cookie["email"],
      "x-entity-user-id" => auth_cookie["entity_user_id"].to_s,
      "Content-Type" => "application/json"
    }

    
    test_api_host = "https://api.eagleview.eupheme.tech"
    response = HTTParty.post(
      "#{test_api_host}/v1/deals/#{deal_id}/signature_groups/#{signature_id}/block_collections?expand=blocks.signing_capacity.user,blocks.signature_entity.signing_capacities.user,blocks.voting_interests&page=0",
      body: individual_data.as_json,
      headers: headers
    )

    expect(JSON.parse(response.body)["status"]).to eq(200)
    JSON.parse(response.body)["data"]
  end


  class CreateIndividualMember 
    attr_accessor :block_collection 

    def initialize(options = {})
      @name = options.fetch(:block_collection, "name #{Time.now.to_i}")
    end

    def as_json
      {
        block_collection:{"block":{"voting_interests":[],
          "signing_capacity":{"first_name":"","last_name":"","use_placeholder_name":true,"placeholder_id":4,"phone_number_attributes":{"phone_number":"","dial_code":"","country_code":""},
          "user":{"email":""},
          "primary_address":{"address_line_one":"","address_line_two":"","city":"","state_or_province":"","postal_code":""},
          "copy_to_address":{"use_copy_to":false,"address_line_one":"","address_line_two":"","city":"","state_or_province":"","postal_code":""}}}}
      }.to_json
    end
  end