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
        find("[data-test-id='empty-checklist-add-button']").click
        find("[data-test-id='item-document']").click
        find("[data-test-id='item-title']").click 
        find("[data-test-id='status-name']").click
        find("[data-test-id='item-documents']").click
        find("[data-test-id='add-new-attachment']").click 
        find("[data-test-id='upload-new-local-version']").click
        sleep 10
        
        find("[data-test-id~='attachment-file-input']", visible: false).set("/Users/user/Downloads/file-sample_100kB.doc")
        sleep 10
        find("[data-test-id='checklist-item-version']").click 
        find("[id='download']").click
    end
end