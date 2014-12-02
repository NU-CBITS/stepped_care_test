#filename: SC_learn_spec,rb

#this file is to test the functionality of logging in, selecting the "LEARN" section,
# and reading through the first lesson "Think, Feel, Do Your Way Out of Depression"

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Learn_1", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Learn", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  it "- read Lesson 1" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'LEARN'
    expect(page).to have_content 'You have read'
    click_link 'Think, Feel, Do Your Way Out of Depression'
    expect(page).to have_content 'Welcome to ThinkFeelDo!'
    click_link 'Continue'
    expect(page).to have_content 'Why should I use ThinkFeelDo?'
    click_link 'Continue'
    expect(page).to have_content 'Am I just having a bad day?'
    click_link 'Continue'
    expect(page).to have_content 'Depression is treatable'
    click_link 'Continue'
    expect(page).to have_content 'How does ThinkFeelDo work?'
    click_link 'Continue'
    expect(page).to have_content 'Doing less, or doing things that are not enjoyable'
    click_link 'Continue'
    expect(page).to have_content 'Negative thoughts tend to make you disengage'
    click_link 'Continue'
    expect(page).to have_content 'What to expect from the ThinkFeelDo site'
    click_link 'Continue'
    expect(page).to have_content 'Getting Started'
    click_link 'Continue'
    expect(page).to have_content 'Wrapping Up'
    click_link 'Continue'
    expect(page).to have_content 'You have read'
  end

end