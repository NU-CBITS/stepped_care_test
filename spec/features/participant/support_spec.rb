# filename: support_spec.rb
require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Support', type: :feature, sauce: sauce_labs do
  before(:each) do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
      fill_in 'participant_password', with: ENV['Participant_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    click_on 'SUPPORT'
    click_on 'SUPPORT Home'
    expect(page).to have_content 'Frequently Asked Questions'
  end

  # tests
  # Testing Replay Intro button functionality
  it '- replay intro' do
    click_on 'Replay Intro'
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

    click_on 'Continue'
    expect(page).to have_content 'Additional Resources'
  end
  # Will need to add tests for other tools within SUPPORT when these are finalized
end
