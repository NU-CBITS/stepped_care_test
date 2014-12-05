#filename: researcher_users_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Researcher, Users", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Research, Users", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

#Testing creating a super user
  it "- create a super user" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Users'
    expect(page).to have_content 'Listing Users'
    click_on 'New'
    fill_in 'user_email', :with => 'superuser@test.com'
    check 'user_is_admin'
    click_on 'Create'
    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'Super User: Yes'
    expect(page).to have_content 'Email: superuser@test.com'
  end

  #Testing updating a super user
  it "- update a super user" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Users'
    expect(page).to have_content 'Listing Users'
    click_on 'fun@test.com'
    expect(page).to have_content 'Email: fun@test.com'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    check 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: Yes'
    expect(page).to have_content 'Email: fun@test.com'
    expect(page).to have_content 'Roles: Clinician'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    uncheck 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: Yes'
    expect(page).to have_content 'Email: fun@test.com'
    expect(page).to_not have_content 'Roles: Clinician'
  end

  #Testing detroying a super user
  it "- update a super user" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Users'
    expect(page).to have_content 'Listing Users'
    click_on 'superuser@test.com'
    expect(page).to have_content 'Email: superuser@test.com'
    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'User was successfully destroyed.'
    expect(page).to_not have_content 'superuser@test.com'
  end
end