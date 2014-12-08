#filename: user/bugs_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "User Dashboard Bugs", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "User Dashboard Bugs", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  #Testing bug where viewing a video slide in a lesson throws an error
  it "- viewing a video slide in a lesson" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'fun'
    expect(page).to have_content 'Manage Content'
    expect(page).to have_content 'Click the group below for which you wish to moderate.'
    click_on 'Manage Content'
    expect(page).to have_content 'Content Dashboard'
    click_on 'Lessons'
    expect(page).to have_content 'Listing Lessons'
    click_on 'Testing adding/updating slides/lessons'
    expect(page).to have_content 'Test 1'
    expect(page).to have_content 'Test video 1'
    click_on 'Test video 1'
    expect(page).to have_content 'List item 3'
  end
end