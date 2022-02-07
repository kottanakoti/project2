require 'capybara/rspec'
require "capybara_helper_remote"

describe "upload process", type: :feature do
    scenario "UploadDoc" do 
        visit "https://app.titans2.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click
   
        
        expect(page). to have_css("[data-test-id~='nav-item-deals-link']")
        find("[data-test-id='nav-item-deals-link']").click 
        find("[href='deals/2175/roles']").click
        find("[data-test-id='nav-item-checklist']").click 
        
        find("[data-test-id='nav-item-signatures']").click
        #find("[data-test-id='add-signature-group-button']").click
        #find("[data-test-id='signature-group-name-input-field']").set("Grp 1")
        #find("[data-test-id='save-button']").click
        #find("[data-test-id='dropdown-toggle']").click
        #find("[data-test-id='individual-option']").click
        #find("[data-test-id='first-name-input-field']").set("Ramakrishna")
        #find("[data-test-id='last-name-input-field']").set("samineni")
        #find("[data-test-id='email-input-field']").set("ramakrishna.samineni+test1@qualitlabs.com")
        #find("[data-test-id='next-button']").click
        #find("[data-test-id='save-button']").click
        find("[data-test-id='nav-item-pages']").click
        find("[data-test-id='add-signers-button']").click
        find("[data-test-id='add-signature-group-button']").click
        find("[data-test-id='done-button']").click
    end
end