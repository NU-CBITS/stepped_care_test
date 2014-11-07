#filename: SC_login_capy_spec,rb

#purely to start writing using capybara

#will need to require capybara/rspec, maybe rails, maybe capybara/rails

#likely need to update SC_spec_helper.rb SC_login.rb

require_relative '../../SC_login'

describe "Login", :type => :feature do
  before :each do
    Login.create(:participant_email => ENV['Participant_Email'], :participant_password => ENV['Participant_Password'])
  end

  it "Login succeeded" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#session") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Successfully signed in'
  end

  let(:other_user) do
    Login.create(:participant_email => 'asdf@test.com', :participant_password => 'asdf')
  end

  it "Login failed" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#session") do
      fill_in 'participant_email', :with => other_user.participant_email
      fill_in 'participant_password', :with => other_user.participant_password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email address or password'
  end
end