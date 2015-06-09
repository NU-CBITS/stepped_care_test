# filename: user_bugs_spec.rb

describe 'User Dashboard Bugs,', type: :feature, sauce: sauce_labs do
  describe 'Researcher signs in,' do
    before do
      sign_in_user(ENV['Researcher_Email'], ENV['Researcher_Password'])
    end

    it 'creates a participant, assigns a group membership, sees correct ' \
       'calculation of end date' do
      click_on 'Participants'
      click_on 'New'
      fill_in 'participant_study_id', with: 'Tests'
      fill_in 'participant_email', with: 'test@test.com'
      fill_in 'participant_phone_number', with: ENV['Participant_Phone_Number']
      select 'Email', from: 'participant_contact_preference'
      click_on 'Create'
      expect(page).to have_content 'Participant was successfully created.'

      click_on 'Assign New Group'
      select 'Group 1', from: 'membership_group_id'
      fill_in 'membership_start_date',
              with: Date.today.prev_day.strftime('%Y-%m-%d')
      next_year = Date.today + 365
      fill_in 'membership_end_date', with: next_year.strftime('%Y-%m-%d')
      weeks_later = Date.today + 20 * 7
      expect(page).to have_content 'Standard number of weeks: 20, Projected ' \
                                   'End Date from today: ' \
                                   "#{weeks_later.strftime('%m/%d/%Y')}"

      click_on 'Assign'
      expect(page).to have_content 'Group was successfully assigned'

      expect(page).to have_content "Membership Status: Active\nCurrent " \
                                   'Group: Group 1'
    end
  end

  describe 'Clinician signs in,' do
    before do
      sign_in_user(ENV['Clinician_Email'], ENV['Clinician_Password'])
    end

    it 'navigates to Patient Dashboard, see consistent # of Logins in ' \
       'listing page and Patient Report' do
      click_on 'Arms'
      find('h1', text: 'Arms')
      click_on 'Arm 1'
      click_on 'Group 1'
      click_on 'Patient Dashboard'
      within('#patients') do
        within('table#patients tr', text: 'TFD-1111') do
          if page.has_text?('Never Logged In')
            expect(page).to have_content 'TFD-1111 1 1'

            expect(page).to have_content '0'

          else
            expect(page).to have_content 'TFD-1111 2 1'

            expect(page).to have_content '37'
          end
        end
      end

      select_patient('TFD-1111')
      within('.panel.panel-default', text: 'Login Info') do
        if page.has_text?('Never Logged In')
          expect(page).to have_content "Last Logged In: Never Logged In\n" \
                                       "Logins Today: 0\nLogins in the last " \
                                       "seven days: 0\nTotal Logins: 0"

        else
          expect(page).to have_content 'Last Logged In: ' \
                                       "#{Time.now.strftime('%b %d %Y %H')}"

          expect(page).to have_content "Logins Today: 37\nLogins during this " \
                                       "treatment week: 37\nTotal Logins: 37"
        end
      end
    end
  end
end
