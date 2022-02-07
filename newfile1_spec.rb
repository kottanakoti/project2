require 'capybara/rspec'
require "capybara_helper_remote"

describe "signIn process", type: :feature do
    scenario "signIn" do 
        visit "https://app.titans2.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click
   
        
        expect(page). to have_css("[data-test-id~='nav-item-deals-link']")
        find("[data-test-id='nav-item-deals-link']").click
        expect(page). to have_css("[data-test-id~='create-deal-button']")
        find("[data-test-id='create-deal-button']").click
        expect(page). to have_css("[data-test-id~='modal-header']")
        find("[data-test-id='start-with-template']").click
        expect(page). to have_css("[data-test-id~='modal-title']")
        find("[data-test-id='deal-type-5']").click 
        expect(page). to have_css("[placeholder='Search Templates']")
        find("[data-test-id='deal-template-6']").click 
        expect(page). to have_css("[data-test-id~='modal-title']")
        find("[data-test-id='include-data-room-button-yes']").click
        expect(page). to have_css("[data-test-id~='modal-title']")
        click_button 'Yes'
        #find("[data-test-id='use-voting-threshold-button-yes']").click
        expect(page). to have_css("[data-test-id='modal-title']")
        #choose 'Yes'
        check('Yes', allow_label_click: true)
        #find("[for~='3']").click
        #find("[data-test-id='modal-bottom-right-button']").click
        #find(:xpath, '//*[text() = "Yes"]').click
        find("[data-test-id=deal-name]").set("Ramakrishna")
        find("[data-test-id='modal-bottom-right-button']").click
        expect(page). to have_css("[data-test-id='modal-title']")
        #choose 'No. This can be enabled later.'
        #find("[data-test-id='use-deal-email-no-radio']").click
        find(:xpath, '//*[text() = "No. This can be enabled later."]').click
        find("[data-test-id='modal-bottom-right-button']").click
        expect(page). to have_css("[data-test-id='modal-title']")
        sleep 40
        find("[data-test-id~='setup-your-team']").click
        expect(page). to have_css("[data-automationid='splitbuttonprimary']")
        find("[data-test-id='nav-item-checklist']").click 
        find("[data-test-id='empty-checklist-add-button']").click
        find("[data-test-id='item-document']").click
        find("[data-test-id='item-title']").click 
        find("[data-test-id='status-name']").click
        find("[data-test-id='item-documents']").click
        find("[data-test-id='add-new-attachment']").click 
        find("[data-test-id='upload-new-local-version']").click
        find("[data-test-id~='attachment-file-input']", visible: false).set("/Users/user/Downloads/file-sample_100kB.doc")
        
    end
end