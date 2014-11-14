# #filename: SC_do_spec,rb

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
    if page.has_text?('Last Recorded Awake Period:')
      click_on 'Complete'
    else
      yesterday=Date.today.prev_day
      select yesterday.strftime('%a') + ' 7 AM', :from => 'awake_period_start_time'
      select yesterday.strftime('%a') + ' 10 PM', :from => 'awake_period_end_time'
      click_on 'Create'
    end
    expect(page).to have_content 'Awake Period saved'
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
    yesterday=Date.today.prev_day
    expect { select yesterday.strftime('%a') + ' 7 AM', :from => 'awake_period_start_time' }.to raise_error
    expect { select yesterday.strftime('%a') + ' 10 PM', :from => 'awake_period_end_time' }.to raise_error
  end

#this test passes because I do not select a time in the "future_time_picker_0" - should probably sort that out.
  it "- planning" do
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
    click_on '#2 Planning'
    expect(page).to have_content 'The last few times you were here...'
    click_on 'Continue'
    expect(page).to have_content 'We want you to plan one fun thing'
    fill_in 'activity_activity_type_new_title', :with => 'New planned activity'
    today=Date.today
    tomorrow = today + 1
    fill_in 'future_date_picker_0', :with => tomorrow.strftime('%d %b, %Y')
    within("#pleasure_0") do
      choose '6'
    end
    within("#accomplishment_0") do
      choose '3'
    end
    click_on 'Continue'
    expect(page).to have_content 'Activity saved'
    expect(page).to have_content 'Now, plan something that gives you a sense of accomplishment.'
    fill_in 'activity_activity_type_new_title', :with => 'Another planned activity'
    today=Date.today
    tomorrow = today + 1
    fill_in 'future_date_picker_0', :with => tomorrow.strftime('%d %b, %Y')
    within("#pleasure_0") do
      choose '4'
    end
    within("#accomplishment_0") do
      choose '8'
    end
    click_on 'Continue'
    expect(page).to have_content 'Activity saved'
    expect(page).to have_content 'Your Planned Activities'
    click_on 'Continue'
    expect(page).to have_content 'Try to stick with your plans'
    click_on 'Continue'
    expect(page).to have_content 'Upcoming Activities'
  end

  it "- reviewing" do
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
    click_on '#3 Reviewing'
    expect(page).to have_content 'Welcome back!'
    click_on 'Continue'
    expect(page).to have_content "Let's do this..."
    click_on 'Continue'
    if page.has_text?('You said you were going to')
      choose 'Yes'
      choose 'activity_actual_pleasure_intensity_8'
      choose 'activity_actual_accomplishment_intensity_6'
      click_on 'Continue'
      expect(page).to have_content 'Activity saved'
      expect(page).to have_content 'You said you were going to'
      choose 'No'
      fill_in 'activity[noncompliance_reason]', :with => "I didn't have time"
      click_on 'Continue'
      expect(page).to have_content 'Activity saved'
      expect(page).to have_content 'Good Work!'
      click_on 'Continue'
      expect(page).to have_content 'Plan a New Activity'
    else
      expect(page).to have_content "It doesn't look like there are any activities for you to review at this time"
      click_on 'Continue'
      expect(page).to have_content 'Good Work!'
      click_on 'Continue'
      expect(page).to have_content 'Plan a New Activity'
    end
  end

  it "- plan a new activity" do
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
    click_on 'Plan a New Activity'
    expect(page).to have_content "But you don't have to start from scratch,"
    fill_in 'activity_activity_type_new_title', :with => 'New planned activity'
    today=Date.today
    tomorrow = today + 1
    fill_in 'future_date_picker_0', :with => tomorrow.strftime('%d %b, %Y')
    choose 'activity_predicted_pleasure_intensity_4'
    choose 'activity_predicted_accomplishment_intensity_3'
  end

  it "- your activities" do
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
    click_on 'Your Activities'
    expect(page).to have_content 'Activities Overview'
    expect(page).to have_content 'Over the past week'
    page.find("#nav_main li:nth-child(2) a").click
    expect(page).to have_content '3 day view'
    page.find("#nav_main li:nth-child(3) a").click
    expect(page).to have_content 'Completion score'
  end

  it "- navbar functionality" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'DO'
    click_on '#1 Awareness'
    expect(page).to have_content 'You are what you do'
    click_on 'DO'
    click_on '#2 Planning'
    expect(page).to have_content 'The last few times you were here...'
    click_on 'DO'
    click_on '#3 Reviewing'
    expect(page).to have_content 'Welcome back!'
    click_on 'DO'
    click_on 'Plan a New Activity'
    expect(page).to have_content "But you don't have to start from scratch,"
    click_on 'DO'
    click_on 'Your Activities'
    expect(page).to have_content 'Activities Overview'
    click_on 'DO'
    click_on 'DO Landing'
    expect(page).to have_content 'Plan a New Activity'
  end

  it "- skip functionality" do
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
    click_on 'Skip'
    expect(page).to have_content "OK, let's talk about yesterday."
    click_on 'DO'
    click_on '#2 Planning'
    expect(page).to have_content 'The last few times you were here...'
    click_on 'Skip'
    expect(page).to have_content 'We want you to plan one fun thing'
    click_on 'DO'
    click_on '#3 Reviewing'
    expect(page).to have_content 'Welcome back!'
    click_on 'Skip'
    if page.has_text?('You said you were going to')
      expect(page).to have_content 'You said you were going to'
    else
      expect(page).to have_content "It doesn't look like there are any activities for you to review at this time"
    end
  end

  it "- visualization" do
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
    if page.has_text?('Have you done any of these?')
      click_on 'Edit'
      expect(page).to have_content 'You said you were going to'
    elsif page.has_text?('Upcoming Activities')
      expect(page).to have_content 'Activities in your near future '
    else
      expect { page.has_text?('Have you done any of these?') }.to raise_error
    end
  end
end