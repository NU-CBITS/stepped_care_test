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

  #Super Users
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
    click_on 'testsuperusertest@test.com'
    expect(page).to have_content 'Email: testsuperusertest@test.com'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    check 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: Yes'
    expect(page).to have_content 'Email: testsuperusertest@test.com'
    expect(page).to have_content 'Roles: Clinician'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    uncheck 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: Yes'
    expect(page).to have_content 'Email: testsuperusertest@test.com'
    expect(page).to_not have_content 'Roles: Clinician'
  end

  #Testing detroying a super user
  it "- destroy a super user" do
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

  #Researchers
  #Testing creating a Researcher
  it "- create a researcher" do
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
    fill_in 'user_email', :with => 'researcher@test.com'
    check 'user_user_roles_researcher'
    click_on 'Create'
    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: researcher@test.com'
    expect(page).to have_content 'Roles: Researcher'
  end

  #Testing updating a researcher
  it "- update a researcher" do
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
    click_on 'testresearchertest@test.com'
    expect(page).to have_content 'Email: testresearchertest@test.com'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    check 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: testresearchertest@test.com'
    expect(page).to have_content 'Roles: Researcher and Clinician'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    uncheck 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: testresearchertest@test.com'
    expect(page).to have_content 'Roles: Researcher'
    expect(page).to_not have_content 'Roles: Clinician and Researcher'
  end

  #Testing detroying a researcher
  it "- destroy a researcher" do
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
    click_on 'researcher@test.com'
    expect(page).to have_content 'Email: researcher@test.com'
    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'User was successfully destroyed.'
    expect(page).to_not have_content 'researcher@test.com'
  end

  #Clinicians
  #Testing creating a clinician
  it "- create a clincian" do
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
    fill_in 'user_email', :with => 'clinician@test.com'
    check 'user_user_roles_clinician'
    click_on 'Create'
    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: clinician@test.com'
    expect(page).to have_content 'Roles: Clinician'
  end

  #Testing updating a clinician
  it "- update a clinician" do
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
    click_on 'testcliniciantest@test.com'
    expect(page).to have_content 'Email: testcliniciantest@test.com'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    check 'user_user_roles_content_author'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: testcliniciantest@test.com'
    expect(page).to have_content 'Roles: Clinician and Content Author'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    uncheck 'user_user_roles_content_author'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: testcliniciantest@test.com'
    expect(page).to have_content 'Roles: Clinician'
    expect(page).to_not have_content 'Roles: Clinician and Content Author'
  end

  #Testing detroying a clinician
  it "- destroy a clinician" do
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
    click_on 'clinician@test.com'
    expect(page).to have_content 'Email: clinician@test.com'
    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'User was successfully destroyed.'
    expect(page).to_not have_content 'clinician@test.com'
  end

  #Content Authors
  #Testing creating a content author
  it "- create a content author" do
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
    fill_in 'user_email', :with => 'contentauthor@test.com'
    check 'user_user_roles_content_author'
    click_on 'Create'
    expect(page).to have_content 'User was successfully created.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: contentauthor@test.com'
    expect(page).to have_content 'Roles: Content Author'
  end

  #Testing updating a content author
  it "- update a content author" do
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
    click_on 'testcontentauthortest@test.com'
    expect(page).to have_content 'Email: testcontentauthortest@test.com'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    check 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: testcontentauthortest@test.com'
    expect(page).to have_content 'Roles: Content Author and Clinician'
    click_on 'Edit'
    expect(page).to have_content 'Editing User'
    uncheck 'user_user_roles_clinician'
    click_on 'Update'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'Super User: No'
    expect(page).to have_content 'Email: testcontentauthortest@test.com'
    expect(page).to have_content 'Roles: Content Author'
    expect(page).to_not have_content 'Roles: Clinician and Content Author'
  end

  #Testing detroying a content author
  it "- destroy a content author" do
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
    click_on 'contentauthor@test.com'
    expect(page).to have_content 'Email: contentauthor@test.com'
    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'User was successfully destroyed.'
    expect(page).to_not have_content 'contentauthor@test.com'
  end
end