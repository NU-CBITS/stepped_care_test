#filename: SC_message_spec,rb

#this file is to test the functionality of logging in, selecting the "LEARN" section,
# and reading through the first lesson "Think, Feel, Do Your Way Out of Depression"

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Messages", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
  describe "Messages", :type => :feature, :sauce => false do

    before(:each) do
      Capybara.default_driver = :selenium
    end

#tests
    it "- compose new" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_link 'Compose'
      expect(page).to have_content 'To Your Coach'
      within ("#new_message") do
        fill_in 'message_subject', :with => 'New message'
        fill_in 'message_body', :with => 'This is a test message to my coach. Hello, Coach! How are you??'
      end
      click_button 'Send'
      expect(page).to have_content 'Message saved'
    end

    it "- read new" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_link 'Sent'
      expect(page).to have_content 'To: Coach'
      click_link 'New message'
      expect(page).to have_content 'This is a test message to my coach.'
    end

end