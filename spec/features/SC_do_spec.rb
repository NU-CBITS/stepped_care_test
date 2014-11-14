# #filename: SC_think_spec,rb

#this file is to test the functionality of logging in, selecting the "LEARN" section,
# and reading through the first lesson "Think, Feel, Do Your Way Out of Depression"

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Do", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Do", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  it "- awareness" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'DO'
    click_on 'DO Landing'
    expect(page).to have_content 'Plan a New Activity'
    click_on '#1 Awareness'
    expect(page).to have_content 'You are what you do'
    click_on 'Continue'
    expect(page).to have_content "OK, let's talk about yesterday."
  #use this line if there is already a time period set for yesterday
    click_on 'Complete'
  #use this next block if there is not a time period already set for yesterday
  #need to figure out how to set the day automatically - currently you need to change the day to reflect yesterday
    # select 'Wed 7 AM', :from => 'awake_period_start_time'
    # select 'Wed 10 PM', :from => 'awake_period_end_time'
    # click_on 'Create'
    # expect(page).to have_content 'Awake Period saved'
    fill_in 'activity_type_0', :with => 'Get ready for work'
    within("#pleasure_0") do
      choose '6'
    end
    within("#accomplishment_0") do
      choose '7'
    end
    fill_in 'activity_type_1', :with => 'Travel to work'
    within("#pleasure_1") do
      choose '3'
    end
    within("#accomplishment_1") do
      choose '5'
    end
    fill_in 'activity_type_2', :with => 'Work'
    within("#pleasure_2") do
      choose '5'
    end
    within("#accomplishment_2") do
      choose '8'
    end
    click_on 'copy_3'
    click_on 'copy_4'
    click_on 'copy_5'
    click_on 'copy_6'
    click_on 'copy_7'
    click_on 'copy_8'
    click_on 'copy_9'
    fill_in 'activity_type_10', :with => 'Travel from work'
    within("#pleasure_10") do
      choose '5'
    end
    within("#accomplishment_10") do
      choose '8'
    end
    fill_in 'activity_type_11', :with => 'eat dinner'
    within("#pleasure_11") do
      choose '8'
    end
    within("#accomplishment_11") do
      choose '8'
    end
    fill_in 'activity_type_12', :with => 'Watch TV'
    within("#pleasure_12") do
      choose '9'
    end
    within("#accomplishment_12") do
      choose '3'
    end
    click_on 'copy_13'
    fill_in 'activity_type_14', :with => 'Get ready for bed'
    within("#pleasure_14") do
      choose '2'
    end
    within("#accomplishment_14") do
      choose '3'
    end
    click_on 'Continue'
    expect(page).to have_content 'Activity saved'
    click_on 'Continue'
    expect(page).to have_content 'Things you found fun.'
    click_on 'Continue'
    expect(page).to have_content "Things that make you feel like you've accomplished something."
    click_on 'Continue'
    expect(page).to have_content 'Plan a New Activity'
  end

  it "- awareness, already entered wake period" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'DO'
    click_on 'DO Landing'
    expect(page).to have_content 'Plan a New Activity'
    click_on '#1 Awareness'
    expect(page).to have_content 'You are what you do'
    click_on 'Continue'
    expect(page).to have_content "OK, let's talk about yesterday."
  #need to figure out how to set the day automatically - currently you need to change the day to reflect yesterday
    expect { select 'Wed 9 AM', :from => 'awake_period_start_time' }.to raise_error
    expect { select 'Wed 8 PM', :from => 'awake_period_end_time' }.to raise_error
  end
end