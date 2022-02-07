require 'capybara/rspec'
require "capybara_helper_remote"

describe "deleting process", type: :feature do
    scenario "DeleteDeal" do 
        visit "https://app.titans2.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click
   
        
        expect(page). to have_css("[data-test-id~='nav-item-deals-link']")
        find("[data-test-id='nav-item-deals-link']").click
        find("[href='deals/2176/roles']").click
        sleep 10
        expect(page). to have_css("[data-test-id~='nav-item-deal-settings']")
        find("[data-test-id~='nav-item-deal-settings']").click
        find("[data-test-id='deal-settings-sidebar-item-manageDealData']").click
        find("[data-test-id='delete-deal-button']").click
        check('I confirm I want to delete this deal and I understand this action cannot be undone.', allow_label_click: true)
        find("[data-test-id='confirm-request-or-deletion-button']").click
    end
end