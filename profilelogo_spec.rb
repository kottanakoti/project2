require 'capybara/rspec'
require "capybara_helper_remote"

describe "profile logo process", type: :feature do
    scenario "Uploadlogo" do 
        visit "https://app.titans2.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click

        find("[href='/entity_profile']").click 
        find(:xpath, '//*[text() = "Upload Logo"]').click

        find(:xpath, '//*[text() = "Upload Logo"]', visible: false).set("/Users/user/Downloads/logo-mockup-grey-wall_35913-2122.jpeg")
        sleep 10
        find(:xpath, '//*[text() = "Save"]').click
    end
end