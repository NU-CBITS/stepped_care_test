#filename: SC_login_spec,rb

#this is to test the login functionality. It has two tests, one for a successful login and one for an unsuccessful
# login.

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Login", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Login", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  it "succeeded" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "failed" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => 'asdf@test.com'
      fill_in 'participant_password', :with => 'asdf'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email address or password'
  end


end