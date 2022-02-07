require 'capybara/rspec'
require "capybara_helper_remote"

describe "signIn process", type: :feature do
    scenario "signIn" do 
        visit "https://app.titans.eupheme.tech/" 
        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click

        find("[href='/deals']").click
        find("[href='deals/2430/roles']").click
        find("[data-test-id='nav-item-checklist']").click
        find("[data-test-id='edit-checklist']").click
        find("[data-test-id='add-items-checklist']").click
        find("[data-test-id='item-action-add-section']").click
        
        find("[data-test-id='nav-item-signatures']").click
        find("[name='Signers']").click
        sleep 3
        find("[data-test-id='add-signature-group-button']").click
        find("[data-test-id='signature-group-name-input-field']").set("Group4")
        find("[data-test-id='save-button']").click
        sleep 3
        find("[data-test-id='dropdown-toggle']").click
        find("[data-test-id='individual-option']").click
        find("[data-test-id='first-name-input-field']").set("rama")
        find("[data-test-id='last-name-input-field']").set("krishna")
        find("[data-test-id='email-input-field']").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("[data-test-id='next-button']").click 
        find("[data-test-id='save-button']").click
        find("[data-test-id='nav-item-pages']").click
        find("[data-test-id='add-signers-button']").click
        find("[data-test-id='add-signature-group-button']").click 
        find("[data-test-id='done-button']").click
        find("[data-test-id='nav-item-packets']").click
        sleep 10
        find("[data-test-id='user-3455']").click
        find("[data-test-id='send-signature-packet']").click
        find("[data-test-id='include-signature-only']").click
        find(:xpath, '//*[text() = "Next"]').click
        find(:xpath, '//*[text()="Send"]').click
        #find("[data-test-id='send-packets']").click
        #find("[data-test-id='confirm-send']").click
        #find("[data-test-id='send-button']").click

        #find("[data-test-id='nav-item-checklist']").click 
        #find("[data-test-id='empty-checklist-add-button']").click
        #find("[data-test-id='item-document']").click
        #find("[data-test-id='item-title']").click 
        #find("[data-test-id='status-name']").click
        #find("[data-test-id='item-documents']").click
        #find("[data-test-id='add-new-attachment']").click 
        #find("[data-test-id='upload-new-local-version']").click
        #find("[data-test-id~='attachment-file-input']", visible: false).set("/Users/user/Downloads/file-sample_100kB.doc")
    end
end