#filename: content_author_slideshows_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Content Author, Slideshows", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Content Author, Slideshows", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

  #Testing creating a slideshow
  it "- new slideshow" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'fun'
    expect(page).to have_content 'Manage Content'
    expect(page).to have_content 'Click the group below for which you wish to moderate.'
    click_on 'Manage Content'
    expect(page).to have_content 'Content Dashboard'
    click_on 'Slideshows'
    expect(page).to have_content 'Listing Slideshows'
    click_on 'New'
    expect(page).to have_content 'New Slideshow'
    fill_in 'slideshow_title', :with => 'Test slideshow'
    click_on 'Create'
    expect(page).to have_content 'Successfully created slideshow'
    expect(page).to have_content 'Test slideshow'
  end

  #Testing destroying a slideshow
  it "- destroy slideshow" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => ENV['User_Email']
      fill_in 'user_password', :with => ENV['User_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_on 'fun'
    expect(page).to have_content 'Manage Content'
    expect(page).to have_content 'Click the group below for which you wish to moderate.'
    click_on 'Manage Content'
    expect(page).to have_content 'Content Dashboard'
    click_on 'Slideshows'
    expect(page).to have_content 'Listing Slideshows'
    click_on 'Test slideshow'
    click_on 'Delete'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Slideshow deleted'
    expect(page).to_not have_content 'Test slideshow'
  end
end