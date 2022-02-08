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
        sleep 5
        find("[data-test-id='nav-item-packets']").click
        sleep 15
        find("[class='top-container']").click
        find("[data-test-id='send-signature-packet']").click
        find("[data-test-id='include-signature-only']").click
        find(:xpath, '//*[text() = "Next"]').click
        find(:xpath, '//*[text() = "Link: Generates a link to share with the signer for them to access and sign their packet."]').click
        find(:xpath, '//*[text() = "Create"]').click
        sleep 5
        find("[data-test-id='nav-item-checklist']").click
        find("[data-test-id='nav-item-signatures']").click
        find("[data-test-id='nav-item-packets']").click
        find("[data-test-id='signature-group-name']").click
        find("[data-test-id='view-signature-packets-text']").click
        #find("[data-test-id='link']").click
        #find("[data-test-id='done-button']").click
        packet_url = find("[data-test-id='modal-content'] input[data-test-id='link-url']", visible: false)['value']
        visit(packet_url)
        find("[data-test-id='review-and-sign-button']").click
        sleep 30
        

        within_frame(find(".esignature-container > iframe")) do
            #expect(page).to have_content("I agree to use electronic records and signatures.", wait: 40)
            #find(:css, "label.cb_label").click()
            find("#action-bar-btn-continue").click
            expect(page).to have_css("#action-bar-btn-finish")
            find("[data-qa='signature-icon']").click
            find("#action-bar-btn-finish").click
            end


        
        sleep 10
        find("[data-test-id='user-dropdown']").click
        find("[id='sign-out']").click
        sleep 5

        find("#input-email").set("ramakrishna.samineni+test1@qualitlabs.com")
        find("#input-password").set("QualiT@7890")
        find("[type~=submit]").click
        find("[href='/deals']").click
        find("[href='deals/2430/roles']").click
        find("[data-test-id='nav-item-signatures']").click
        find("[data-test-id='nav-item-packets']").click


        #visit(packet_url)
        #within_frame(find(".esignature-container > iframe")) do
        #expect(page).to have_content("I agree to use electronic records and signatures.", wait: 40)
        #find(:css, "label.cb_label").click()
        #find("#action-bar-btn-continue").click
        #expect(page).to have_css("#action-bar-btn-finish")
        #find("[data-qa='signature-icon']").click
        #expect(page).to have_css("#adopt-dialog-title")
        #click_button("Adopt and Sign")
        #expect(page).to have_content("Signature Applied")
        #find("#action-bar-btn-finish").click
        #end


        #find("[data-test-id='send-packets']").click
        #find("[data-test-id='confirm-send']").click
        #find("[data-test-id='send-button']").click

        
    end
end