# #filename: SC_feel_spec,rb

#this file is to test the functionality of logging in, selecting the "LEARN" section,
# and reading through the first lesson "Think, Feel, Do Your Way Out of Depression"

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Feel", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Do", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  it "- tracking your mood and emotions" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'FEEL'
    click_link 'FEEL Landing'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
    click_link 'Tracking Your Mood and Emotions'
    expect(page).to have_content 'Rate your Mood'
    choose 'mood_rating_6'
    click_on 'Continue'
    expect(page).to have_content 'Mood saved'
    expect(page).to have_content 'You just rated your mood as a 6 (Good)'
    expect(page).to have_content 'Rate your Emotions'
    select 'anxious', :from => 'emotional_rating_emotion_id'
    choose 'emotional_rating_rating_4'
    click_on 'Add Emotion'
    fill_in 'emotional_rating_name', :with => 'crazy'
    page.find('#subcontainer-1').find('#emotional_rating_rating_2').click
    click_on 'Continue'
    expect(page).to have_content 'Emotional Rating saved'
    expect(page).to have_content 'Your Recent Emotions'
    click_on 'Continue'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end

  it "- view your recent emotions" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'FEEL'
    click_link 'FEEL Landing'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
    click_on 'View Your Recent Emotions'
    expect(page).to have_content 'Mood'
    click_on 'Continue'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end

  it "- navbar functionality" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'FEEL'
    click_link 'Tracking Your Mood and Emotions'
    expect(page).to have_content 'Rate your Mood'
    click_link 'FEEL'
    click_on 'View Your Recent Emotions'
    expect(page).to have_content 'Your Recent Emotions'
    click_link 'FEEL'
    click_link 'FEEL Landing'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end
end