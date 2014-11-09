#filename: SC_login_capy_spec,rb

#purely to start writing using capybara

#will need to require capybara/rspec, maybe rails, maybe capybara/rails

#likely need to update SC_spec_helper.rb SC_login.rb

require_relative '../../spec/SC_spec_helper'

describe "Login", :sauce => true do
# describe "Login", :type => :feature do
  before(:each) do
    Capybara.current_driver = :selenium
  end

  # before :each do
  #   Login.with(:participant_email => ENV['Participant_Email'], :participant_password => ENV['Participant_Password'])
  # end

  it "Login succeeded" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end

  # let(:other_user) do
  #   Login.create(:participant_email => 'asdf@test.com', :participant_password => 'asdf')
  # end

  it "Login failed" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => 'asdf@test.com'
      fill_in 'participant_password', :with => 'asdf'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email address or password'
  end


end