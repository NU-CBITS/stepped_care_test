#filename: coach_site_messages_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

#to run locally comment this line out
# describe "Coach, Site Messages", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Coach, Site Messages", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

#Testing new site messages
  it "- new site message" do
    visit ENV['Base_URL']+ '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Groups'
    expect(page).to have_content 'Listing Groups'
    click_on 'fake'
    expect(page).to have_content 'Participant Info'
    click_on 'Messaging'
    click_on 'Site Messaging'
    expect(page).to have_content 'Listing Site Messages'
    expect(page).to have_content 'The first message'
    click_on 'New'
    expect(page).to have_content 'New site message'
    expect(page).to have_content 'stepped_care-no-reply@northwestern.edu'
    select 'ChrisBrennerTest', :from => 'site_message_participant_id'
    fill_in 'site_message_subject', :with => 'Testing site messaging'
    fill_in 'site_message_body', :with => 'This message is intended to test the functionality of site messaging.'
    click_on 'Send'
    expect(page).to have_content 'Site message was successfully created.'
    expect(page).to have_content 'Participant: ChrisBrennerTest'
    expect(page).to have_content 'Subject: Testing site messaging'
    expect(page).to have_content 'Body: This message is intended to test the functionality of site messaging.'
  end

#Testing site messages show
  it "- show site message" do
    visit ENV['Base_URL']+ '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Groups'
    expect(page).to have_content 'Listing Groups'
    click_on 'fake'
    expect(page).to have_content 'Participant Info'
    click_on 'Messaging'
    click_on 'Site Messaging'
    expect(page).to have_content 'Listing Site Messages'
    expect(page).to have_content 'The first message'
    first(:link, 'Show').click
    expect(page).to have_content 'Participant: ChrisBrennerTest'
    expect(page).to have_content 'Subject: The first message'
    expect(page).to have_content 'Body: This is a site message for testing purposes.'
  end
end