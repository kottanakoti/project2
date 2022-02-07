require 'capybara/rspec'
require "capybara_helper_remote"

describe "auditlog download process", type: :feature do
    scenario "Auditlog" do 
        visit "https://app.titans2.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click 

        find("[href='/deals']").click
        find("[href='deals/2170/roles']").click
        find("[data-test-id='nav-item-data-room']").click
        find("[data-test-id='dropdown-toggle']").click
        find("[data-test-id='add-folder']").click
    end
end