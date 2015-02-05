# filename: feel_spec.rb

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Feel', type: :feature, sauce: sauce_labs do
  before(:each) do
    visit ENV['Base_URL'] + '/participants/sign_in'
    within('#new_participant') do
      fill_in 'participant_email', with: ENV['Participant_Email']
      fill_in 'participant_password', with: ENV['Participant_Password']
    end

    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    click_on 'FEEL'
    click_on 'FEEL Home'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end

  # tests
  # Testing Tracking Your Mood and Emotions in the FEEL to
  it '- tracking your mood and emotions' do
    click_on 'Tracking Your Mood and Emotions'
    expect(page).to have_content 'Rate your Mood'

    select '6', from: 'mood[rating]'
    click_on 'Continue'
    expect(page).to have_content 'Mood saved'

    expect(page).to have_content 'You just rated your mood as a 6 (Good)'

    expect(page).to have_content 'Rate your Emotions'

    select 'anxious', from: 'emotional_rating_emotion_id'
    select 'negative', from: 'emotional_rating[is_positive]'
    select '4', from: 'emotional_rating[rating]'
    click_on 'Add Emotion'
    fill_in 'emotional_rating_name', with: 'crazy'
    find(:xpath, '/html/body/div[1]/div[1]/div/div[3]/div[3]/div/form/div[4]/select/option[1]').click
    find(:xpath, 'html/body/div[1]/div[1]/div/div[3]/div[3]/div/form/div[5]/div/select/option[4]').click
    click_on 'Continue'
    expect(page).to have_content 'Emotional Rating saved'

    expect(page).to have_content 'Your Recent Emotions'

    click_on 'Continue'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end

  # Testing the View Your Recent Emotions portion of the FEEL to
  it '- view your recent emotions' do
    click_on 'View Your Recent Emotions'
    expect(page).to have_content 'Mood'

    click_on 'Continue'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end

  # Testing navbar functionality specifically surrounding the FEEL to
  it '- navbar functionality' do
    visit ENV['Base_URL']
    click_on 'FEEL'
    click_on 'Tracking Your Mood and Emotions'
    expect(page).to have_content 'Rate your Mood'

    click_on 'FEEL'
    click_on 'View Your Recent Emotions'
    expect(page).to have_content 'Your Recent Emotions'

    click_on 'FEEL'
    click_on 'FEEL Home'
    expect(page).to have_content 'Tracking Your Mood and Emotions'
  end
end
