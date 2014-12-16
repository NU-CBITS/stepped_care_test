#filename: user/bugs_spec.rb

#this is to test the users Arm 1ctionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

#to run locally comment this line out
# describe "User Dashboard Bugs", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "User Dashboard Bugs", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
  #Testing bug where viewing a video slide in a lesson throws an error
  it "- viewing a video slide in a lesson" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Arm 1'
    expect(page).to have_content 'Manage Content'
    expect(page).to have_content 'Click the group below for which you wish to moderate.'
    click_on 'Manage Content'
    expect(page).to have_content 'Content Dashboard'
    click_on 'Lesson Modules'
    expect(page).to have_content 'Listing Lesson Modules'
    click_on 'Testing adding/updating slides/lessons'
    expect(page).to have_content 'Test video slide 1'
    click_on 'Test video slide 1'
    expect(page).to have_content 'This slide was added for automated testing purposes'
  end

  #Testing bug where you receive error message when trying to edit a provider
  it "- editing a provider" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'Arm 1'
    expect(page).to have_content 'Manage Content'
    expect(page).to have_content 'Click the group below for which you wish to moderate.'
    click_on 'Manage Content'
    expect(page).to have_content 'Content Dashboard'
    click_on 'Content Modules'
    expect(page).to have_content 'Content Modules'
    if page.has_text?('Testing adding/updating slides/lessons')
      click_on 'Testing adding/updating slides/lessons'
      expect(page).to have_content 'New Provider'
      click_on 'slideshow provider'
      expect(page).to have_content 'Content Provider'
      expect(page).to have_content 'slideshow provider'
      click_on 'Edit'
      expect(page).to have_content 'Editing Content Provider'
    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?('Testing adding/updating slides/lessons')
        click_on 'Testing adding/updating slides/lessons'
        expect(page).to have_content 'New Provider'
        click_on 'slideshow provider'
        expect(page).to have_content 'Content Provider'
        expect(page).to have_content 'slideshow provider'
        click_on 'Edit'
        expect(page).to have_content 'Editing Content Provider'
      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
          click_on 'Testing adding/updating slides/lessons'
          expect(page).to have_content 'New Provider'
          click_on 'slideshow provider'
          expect(page).to have_content 'Content Provider'
          expect(page).to have_content 'slideshow provider'
          click_on 'Edit'
          expect(page).to have_content 'Editing Content Provider'
      end
    end
  end

  #Testing bug where you receive an error message when trying to access a specific group on Researcher Dashboard
  it "- error message when accesing a group" do
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
  end

  #Testing bug where you receive an error message when trying to access specific user on Researcher Dashboard
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
    click_on ENV['Content_Author_Email']
    expect(page).to have_content 'Email: ' + ENV['Content_Author_Email']
  end
end