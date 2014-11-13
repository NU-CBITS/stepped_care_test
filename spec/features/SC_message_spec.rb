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
      # the below reference will change depending on what data is on the server
      click_link 'I need some help with Planning an Activity'
      expect(page).to have_content 'I forgot where this is.'
    end

    #this will only work if a message has been sent to the test participant containing the content below
    it "- accessing ALL links from a message in inbox" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'GO TO INTRO'
      expect(page).to have_content 'Introduction to ThinkFeelDo'
      click_on 'Introduction to ThinkFeelDo'
      expect(page).to have_content 'Welcome to ThinkFeelDo'
      click_on 'Continue'
      expect(page).to have_content 'How to Maximize Your Benefit from ThinkFeelDo'
      click_on 'Continue'
      expect(page).to have_content 'What Should I Do When I Log in?'
      click_on 'Continue'
      expect(page).to have_content "How Do I Know What's New on the Site?"
      click_on 'Continue'
      expect(page).to have_content 'What Should I Expect?'
      click_on 'Continue'
      expect(page).to have_content 'What Might Get in the Way?'
      click_on 'Continue'
      expect(page).to have_content 'Get Started'
      click_on 'Done'
      expect(page).to have_content 'Signed in as cbrenner265+sauce@gmail.com'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on '#1 Identifying'
      expect(page).to have_content 'You are what you think...'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on '#2 Patterns'
      expect(page).to have_content 'Thinking Patterns'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on '#3 Reshape'
      expect(page).to have_content 'Challenging Harmful Thoughts'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Add a New Thought'
      expect(page).to have_content 'This thought is:'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Thoughts'
      expect(page).to have_content 'Harmful Thoughts'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Thought Distortions'
      expect(page).to have_content 'Click a bubble for more info'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Tracking Your Mood and Emotions'
      expect(page).to have_content 'Rate your Mood'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Tracking Your Mood'
      expect(page).to have_content 'Rate your Mood'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'View Your Recent Emotions'
      expect(page).to have_content 'Your Recent Emotions'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on '#1 Awareness'
      expect(page).to have_content 'You are what you do'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on '#2 Planning'
      expect(page).to have_content 'The last few times you were here...'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on '#3 Reviewing'
      expect(page).to have_content 'Welcome back!'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Your Activities'
      expect(page).to have_content 'Activities Overview'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'All links'
      expect(page).to have_content 'From Coach'
      click_on 'Plan a New Activity'
      expect(page).to have_content "But you don't have to start from scratch,"
    end

    it "- reply" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'GO TO INTRO'
      expect(page).to have_content 'Introduction to ThinkFeelDo'
      click_on 'Reply'
      expect(page).to have_content 'To Coach'
      within ("#new_message") do
        fill_in 'message_body', :with => 'Got it. Thanks!'
      end
      click_on 'Send'
      expect(page).to have_content 'Message saved'
    end

    it "- compose while reading a message" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'GO TO INTRO'
      expect(page).to have_content 'Introduction to ThinkFeelDo'
      click_on 'Compose'
      expect(page).to have_content 'To Your Coach'
    end

    it "- cancel button" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'Compose'
      expect(page).to have_content 'To Your Coach'
      click_on 'Cancel'
      expect(page).to have_content 'Inbox'
    end

    it "- return button" do
      visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
      within("#new_participant") do
        fill_in 'participant_email', :with => ENV['Participant_Email']
        fill_in 'participant_password', :with => ENV['Participant_Password']
      end
      click_button 'Sign in'
      expect(page).to have_content 'Signed in successfully'
      click_link 'MESSAGES'
      expect(page).to have_content 'Inbox'
      click_on 'Compose'
      expect(page).to have_content 'To Your Coach'
      click_on 'Return'
      expect(page).to have_content 'Inbox'
    end
end