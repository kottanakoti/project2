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
        #find("[href='deals/2176/roles']").click
        sleep 10
        auth_cookie = get_authentication_cookie
        deal_id = 373
          # Create Role in WGL
        role_data = CreateRoleInWGL.new
        puts role_data
        role_2 = post_role_in_wgl(deal_id, role_data, auth_cookie)
    end
  end

        def get_authentication_cookie
            browser = Capybara.current_session.driver.browser.manage
            #byebug
            cookie_value = browser.cookie_named("authentication")[:value]
            jwt_token = (browser.cookie_named("jwtToken")[:value] rescue '')
            JSON.parse(CGI.unescape(cookie_value)).merge('jwt_token' => jwt_token)
          end

        

        def post_role_in_wgl(deal_id, role_data, auth_cookie)
            headers = {
              "x-user-token" => auth_cookie["token"],
              "AUTHORIZATION" => auth_cookie["jwt_token"],
              "x-user-email" => auth_cookie["email"],
              "x-entity-user-id" => auth_cookie["entity_user_id"].to_s,
              "Content-Type" => "application/json"
            }
            test_api_host = "https://api.eagleview.eupheme.tech"
            response = HTTParty.post(
              "#{test_api_host}/v1/deals/#{deal_id}/roles?expand=&include_unauthorized_deal_entity_users=false",
              body: role_data.as_json,
              headers: headers
            )
          
            expect(JSON.parse(response.body)["status"]).to eq(201)
            JSON.parse(response.body)["data"]
          end
          


          
           
        
          class CreateRoleInWGL
            attr_accessor :role_name
          
            def initialize(options = {})
              @role_name = options.fetch(:role_name, "Role name #{Time.now.to_i}")
            end
          
            def as_json
              {
                role: {
                  name: @role_name
                }
              }.to_json
            end
          end

          
          
        
    


