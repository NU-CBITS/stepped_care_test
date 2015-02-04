# filename: learn_spec.rb
require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Learn', type: :feature, sauce: sauce_labs do
  before(:each) do
    Capybara.default_driver = :selenium
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
      fill_in 'participant_password', with: ENV['Participant_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    click_on 'LEARN'
    expect(page).to have_content 'Lessons'
  end

  # tests
  it '- read Lesson 1' do
    find(:xpath, '//*[@id="heading1"]/a/h3').click
    click_on 'Think, Feel, Do Your Way Out of Depression'
    expect(page).to have_content 'Welcome to ThinkFeelDo!'

    click_on 'Continue'
    expect(page).to have_content 'Why should I use ThinkFeelDo?'

    click_on 'Continue'
    expect(page).to have_content 'Am I just having a bad day?'

    click_on 'Continue'
    expect(page).to have_content 'Depression is treatable'

    click_on 'Continue'
    expect(page).to have_content 'How does ThinkFeelDo work?'

    click_on 'Continue'
    expect(page).to have_content 'Doing less, or doing things that are not enjoyable'

    click_on 'Continue'
    expect(page).to have_content 'Negative thoughts tend to make you disengage'

    click_on 'Continue'
    expect(page).to have_content 'What to expect from the ThinkFeelDo site'

    click_on 'Continue'
    expect(page).to have_content 'Getting Started'

    click_on 'Continue'
    expect(page).to have_content 'Wrapping Up'

    click_on 'Continue'
    expect(page).to have_content 'Lessons'
  end

  it '- print a read lesson' do
    find(:xpath, '//*[@id="heading1"]/a/h3').click
    find(:xpath, '//*[@id="collapse1"]/div/span[1]/p/span/a').click
    expect(page).to have_content 'Print'

    expect(page).to have_content 'Return to Lessons'

    click_on 'Return to Lessons'
    expect(page).to have_content 'Week 1'
  end
end
