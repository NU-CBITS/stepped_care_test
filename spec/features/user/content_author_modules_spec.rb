#filename: content_author_modules_spec.rb

#this is to test the users functionality on the researcher dashboard.

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Content Author, Modules", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Content Author, Modules", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

  #Testing creating a module
  it "- new module" do
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
    click_on 'Modules'
    expect(page).to have_content 'Content Modules'
    click_on 'New Module'
    expect(page).to have_content 'New Content Module'
    fill_in 'content_module_title', :with => 'Test content module'
    select 'THINK', :from => 'content_module_bit_core_tool_id'
    fill_in 'content_module_position', :with => '8'
    click_on 'Create'
    expect(page).to have_content 'Content module was successfully created.'
    expect(page).to have_content 'Position: 8 / 8'
  end

  #Testing destroying a module
  it "- destroy module" do
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
    click_on 'Modules'
    expect(page).to have_content 'Content Modules'
    if page.has_text?("Test content module")
      click_on 'Test content module'
      click_on 'Destroy'
      page.accept_alert 'Are you sure?'
      expect(page).to have_content 'Content module along with any associated tasks were successfully destroyed.'
      expect(page).to_not have_content 'Test content module'
    else
      within 'pagination' do
        click_on '2'
        if page.has_text?("Test content module")
          click_on 'Test content module'
          click_on 'Destroy'
          page.accept_alert 'Are you sure?'
          expect(page).to have_content 'Content module along with any associated tasks were successfully destroyed.'
          expect(page).to_not have_content 'Test content module'
        else
          within 'pagination' do
            click_on '3'
          end
          click_on 'Test content module'
          click_on 'Destroy'
          page.accept_alert 'Are you sure?'
          expect(page).to have_content 'Content module along with any associated tasks were successfully destroyed.'
          expect(page).to_not have_content 'Test content module'
        end
      end
    end
  end
end