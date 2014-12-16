#filename: coach_patients_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Coach, Patients", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Coach, Patients", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  #Testing inbox
  it "- view patients dashboard" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Coach Dashboard'
    expect(page).to have_content 'Site Messages'
    click_on 'Patients'
    expect(page).to have_content 'Patient Dashboard'
    page.find("#patients")[:class].include?("table table hover")
  end
end