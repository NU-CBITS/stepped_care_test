#filename: SC_think_spec,rb

#this file is to test the functionality of logging in, selecting the "LEARN" section,
# and reading through the first lesson "Think, Feel, Do Your Way Out of Depression"

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Think", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Think", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  it "- add a new thought" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link 'Add a New Thought'
    expect(page).to have_content 'This thought is:'
    within("#new_thought") do
      fill_in 'thought_content', :with => 'Testing negative thought'
      choose('harmful')
      select 'Magnifying or Minimizing', :from => 'thought_pattern_id'
      fill_in 'thought_challenging_thought', :with => 'Testing challenge thought'
      fill_in 'thought_act_as_if', :with => 'Testing act-as-if action'
    end
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    click_on 'Continue'
    expect(page).to have_content 'Add a New Thought'
  end

end
