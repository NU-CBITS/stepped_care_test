#filename: content_author_lessons_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'



#to run locally comment this line out
# describe "Content Author, Lessons", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Content Author, Lessons", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

  #Testing creating a lesson
  it "- new lesson" do
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
    click_on 'Lessons'
    expect(page).to have_content 'Listing Lessons'
    click_on 'New'
    fill_in 'lesson_title', :with => 'Test lesson'
    fill_in 'lesson_position', :with => '45'
    click_on 'Create'
    expect(page).to have_content 'Successfully created lesson'
    expect(page).to have_content 'Test lesson'
    expect(page).to have_content 'Add Video Slide'
  end

  #Testing updating a lesson
  it "- updating lesson" do
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
    click_on 'Lessons'
    expect(page).to have_content 'Listing Lessons'
    click_on 'Testing adding/updating slides/lessons'
    expect(page).to have_content 'Test 1'
    expect(page).to have_content 'Test video 1'
    find(:xpath, 'html/body/div[1]/div/div/div[2]/div[1]/a[4]').click
    fill_in 'lesson_title', :with => 'Testing adding/updating slides/lessons 123'
    click_on 'Update'
    expect(page).to have_content 'Successfully updated lesson'
    expect(page).to have_content 'Testing adding/updating slides/lessons 123'
    expect(page).to have_content 'Add Video Slide'
    find(:xpath, 'html/body/div[1]/div/div/div[2]/div[1]/a[4]').click
    fill_in 'lesson_title', :with => 'Testing adding/updating slides/lessons'
    click_on 'Update'
    expect(page).to have_content 'Successfully updated lesson'
    expect(page).to have_content 'Testing adding/updating slides/lessons'
    expect(page).to have_content 'Add Video Slide'
  end

  #Testing drag and drop lesson sorting
  it "- drag and drop sorting" do
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
    click_on 'Lessons'
    expect(page).to have_content 'Listing Lessons'
    source = page.find(:xpath, 'html/body/div[1]/div/div/div[2]/table/tbody/tr[42]/td[1]/span/i')
    target = page.find(:xpath, 'html/body/div[1]/div/div/div[2]/table/tbody/tr[40]/td[1]/span/i')
    source.drag_to(target)
    within("tr:nth-child(40)") do
      find('#lesson-1032687475>td>a>p')
    end
    within("tr:nth-child(41)") do
      find('#lesson-1032687501>td>a>p')
    end
    source = page.find(:xpath, 'html/body/div[1]/div/div/div[2]/table/tbody/tr[40]/td[1]/span/i')
    target = page.find(:xpath, 'html/body/div[1]/div/div/div[2]/table/tbody/tr[43]/td[1]/span/i')
    source.drag_to(target)
    within("tr:nth-child(40)") do
      find('#lesson-1032687501>td>a>p')
    end
    within("tr:nth-child(42)") do
      find('#lesson-1032687475>td>a>p')
    end
  end

  #Testing destroying  a lesson
  it "- destroy lesson" do
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
    click_on 'Lessons'
    expect(page).to have_content 'Listing Lessons'
    find(:xpath, 'html/body/div[1]/div/div/div[2]/table/tbody/tr[44]/td[6]/a[2]').click
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Lesson deleted'
    expect(page).to_not have_content 'Test lesson'
  end
end