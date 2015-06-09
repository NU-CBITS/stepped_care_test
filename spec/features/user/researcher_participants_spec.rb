# filename: researcher_participants_spec.rb

describe 'Researcher signs in, navigates to Participants,',
         type: :feature, sauce: sauce_labs do
  before do
    sign_in_user(ENV['Researcher_Email'], ENV['Researcher_Password'])
    click_on 'Participants'
  end

  it 'creates a participant' do
    click_on 'New'
    fill_in 'participant_study_id', with: 'Tests'
    fill_in 'participant_email', with: 'test@test.com'
    fill_in 'participant_phone_number', with: ENV['Participant_Phone_Number']
    select 'Email', from: 'participant_contact_preference'
    click_on 'Create'
    expect(page).to have_content 'Participant was successfully created.'

    expect(page).to have_content "Study Id: Tests\nEmail: test@test.com" \
                                 "\nPhone Number: " \
                                 "#{ENV['Participant_Phone_Number_1']}" \
                                 "\nContact Preference: Email"
  end

  it 'updates a participant' do
    click_on 'TFD-1111'
    click_on 'Edit'
    fill_in 'participant_study_id', with: 'Updated TFD-1111'
    fill_in 'participant_email', with: 'updatedfake@test.com'
    fill_in 'participant_phone_number', with: ENV['Participant_Phone_Number']
    click_on 'Update'
    expect(page).to have_content 'Participant was successfully updated.'

    expect(page).to have_content 'Study Id: Updated TFD-1111' \
                                 "\nEmail: updatedfake@test.com" \
                                 "\nPhone Number: " \
                                 "#{ENV['Participant_Phone_Number_1']}" \
                                 "\nContact Preference: Email"

    click_on 'Edit'
    fill_in 'participant_study_id', with: 'TFD-1111'
    fill_in 'participant_email', with: ENV['Participant_Email']
    fill_in 'participant_phone_number', with: ENV['Participant_Phone_Number']
    click_on 'Update'
    expect(page).to have_content 'Participant was successfully updated.'

    expect(page).to have_content 'Study Id: TFD-1111' \
                                 "\nEmail: #{ENV['Participant_Email']}" \
                                 "\nPhone Number: " \
                                 "#{ENV['Participant_Phone_Number_1']}" \
                                 "\nContact Preference: Email"
  end

  it 'cannot assign a coach without a group membership' do
    click_on 'Tests'
    expect(page).to have_content 'Current Coach/Moderator: None'

    expect { click_on 'Assign Coach/Moderator' }.to raise_error

    expect(page).to have_content '* Please assign Group first'
  end

  it 'assigns a group membership' do
    click_on 'Tests'
    click_on 'Assign New Group'
    select 'Group 1', from: 'membership_group_id'
    fill_in 'membership_start_date',
            with: Date.today.prev_day.strftime('%Y-%m-%d')
    next_year = Date.today + 365
    fill_in 'membership_end_date', with: next_year.strftime('%Y-%m-%d')
    weeks_later = Date.today + 20 * 7
    expect(page).to have_content 'Standard number of weeks: 20, Projected End' \
                                 ' Date from today: ' \
                                 "#{weeks_later.strftime('%m/%d/%Y')}"

    click_on 'Assign'
    expect(page).to have_content 'Group was successfully assigned'

    expect(page).to have_content "Membership Status: Active\nCurrent " \
                                 'Group: Group 1'
  end

  it 'assigns a coach' do
    click_on 'Tests'
    click_on 'Assign Coach/Moderator'
    select 'clinician1@example.com', from: 'coach_assignment_coach_id'
    click_on 'Assign'
    expect(page).to have_content 'Coach/Moderator was successfully assigned'

    expect(page).to have_content 'Current Coach/Moderator: ' \
                                 "#{ENV['Clinician_Email']}"
  end

  it 'destroys a participant' do
    click_on 'Tests'
    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Participant was successfully destroyed.'

    expect(page).to_not have_content 'Tests'
  end

  it 'uses breadcrumbs to return to home through Participants' do
    click_on 'TFD-1111'
    expect(page).to have_content 'Contact Preference'

    within('.breadcrumb') do
      click_on 'Participants'
    end

    expect(page).to have_content 'New'

    within('.breadcrumb') do
      click_on 'Home'
    end

    expect(page).to have_content 'Arms'
  end

  it 'uses breadcrumbs to return to home through Groups' do
    click_on 'TFD-1111'
    expect(page).to have_content 'Contact Preference'

    click_on 'Group'
    within('.breadcrumb') do
      click_on 'Groups'
    end

    expect(page).to have_content 'New'

    within('.breadcrumb') do
      click_on 'Home'
    end

    expect(page).to have_content 'Arms'
  end
end
