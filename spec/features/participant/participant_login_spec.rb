# filename: participant_login_spec.rb

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Login', type: :feature, sauce: sauce_labs do
  # tests
  # Testing a successful login
  it '- success' do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
      fill_in 'participant_password', with: ENV['Participant_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  # Testing the Sign Out functionality
  it '- sign out' do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
      fill_in 'participant_password', with: ENV['Participant_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    find(:xpath, '//*[@id="navbar-collapse"]/ul[2]/li/a').click
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  # Testing a failed login
  it '- failure' do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: 'asdf@test.com'
      fill_in 'participant_password', with: 'asdf'
    end
    click_on 'Sign in'
    expect(page).to have_content 'Invalid email address or password'
  end

  # Testing Brand Link functionality
  it '- brand link redirect' do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
      fill_in 'participant_password', with: ENV['Participant_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    visit ENV['Base_URL'] + '/navigator/contexts/LEARN'
    expect(page).to have_content 'Lessons'
    find(:css, '.navbar-brand').click
    expect(page).to have_content 'Home'
  end

  # Testing a login for a participant who's end date has passed
  it '- after end date' do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Old_Participant_Email']
      fill_in 'participant_password', with: ENV['Old_Participant_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  # Testing redirect to login screen
  it '- not logged in, redirect' do
    visit ENV['Base_URL'] + '/navigator/contexts/THINK'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  # Testing the Introduction Slideshow if a person hits it who isn't logged in
  it '- not logged in, intro slideshow' do
    visit ENV['Base_URL'] + '/participants/sign_in'
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

  # Testing Forgot Your Password? functionality
  it '- forgot password' do
    visit ENV['Base_URL'] + '/participants/sign_in'
    click_on 'Forgot your password?'
    expect(page).to have_content 'Forgot your password?'

    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
    end
    click_on 'Send me reset password instructions'
    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
  end
end
