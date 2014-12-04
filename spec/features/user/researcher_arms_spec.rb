#filename: researcher_arms_spec.rb

#this is to test the arm functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Researcher, Arms", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Research, Arms", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

  #Testing creating an arm
  it "- create an arm" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_button 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Arms'
    expect(page).to have_content 'Listing Arms'
    click_on 'New'
    expect(page).to have_content 'New Arm'
    fill_in 'arm_title', :with => 'Test Arm'
    click_on 'Create'
    expect(page).to have_content 'Arm was successfully created.'
  end

  #Testing updating an arm
  it "- create an arm" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_button 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Arms'
    expect(page).to have_content 'Listing Arms'
    click_on 'fake'
    expect(page).to have_content 'Title: fake'
    click on 'Edit'
    expect(page).to have_content 'Editing Arms'
    fill_in 'arm_title', :with => 'Updated fake'
    click on 'Update'
    expect(page).to have_content 'Arm was successfully updated.'
    expect(page).to have_content 'Title: Updated fake'
  end
end