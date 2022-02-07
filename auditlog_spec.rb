require 'capybara/rspec'
require "capybara_helper_remote"

describe "auditlog download process", type: :feature do
    scenario "Auditlog" do 
        visit "https://app.titans2.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click 

        find("[href='/reports']").click 
        find("[data-test-id='request-audit-log']").click
    end
end