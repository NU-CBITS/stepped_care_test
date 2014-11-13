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
  it "- success" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "- failure" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => 'asdf@test.com'
      fill_in 'participant_password', :with => 'asdf'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email address or password'
  end

  it "- not logged in, redirect" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/navigator/contexts/THINK'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  it "- not logged in, intro slideshow" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
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
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  it "- forgot password" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    click_on 'Forgot your password?'
    expect(page).to have_content 'Forgot your password?'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
    end
    click_button 'Send me reset password instructions'
    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end

end