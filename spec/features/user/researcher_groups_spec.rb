#filename: researcher_groups_spec.rb

#this is to test the groups functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Researcher, Groups", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Research, Groups", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

#Testing creating a group
  it "- create a group" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Groups'
    expect(page).to have_content 'Listing Groups'
    click_on 'New'
    expect(page).to have_content 'New Group'
    fill_in 'group_title', :with => 'Testing Group'
    select 'fun', :from => 'group_arm_id'
    select ENV['User_Email'], :from => 'group_user_id'
    click_on 'Create'
    expect(page).to have_content 'Group was successfully created.'
  end

  #Testing updating a group
  it "- update a group" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Groups'
    expect(page).to have_content 'Listing Groups'
    click_on 'fun'
    expect(page).to have_content 'Title: fun'
    click_on 'Edit'
    expect(page).to have_content 'Editing Group'
    fill_in 'group_title', :with => 'Updated fun'
    click_on 'Update'
    expect(page).to have_content 'Group was successfully updated.'
    expect(page).to have_content 'Title: Updated fun'
    click_on 'Edit'
    expect(page).to have_content 'Editing Group'
    fill_in 'group_title', :with => 'fun'
    click_on 'Update'
    expect(page).to have_content 'Group was successfully updated.'
    expect(page).to have_content 'Title: fun'
  end

  #Testing destroying a group
  it "- destroy a group" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Researcher Dashboard'
    expect(page).to have_content 'CSV Reports'
    click_on 'Groups'
    expect(page).to have_content 'Listing Groups'
    click_on 'Testing Group'
    expect(page).to have_content 'Title: Testing Group'
    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Group was successfully destroyed.'
    expect(page).to_not have_content 'Testing Group'
  end
end