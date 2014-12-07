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

  #Testing updating a module
  it "- edit module" do
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
    if page.has_text?("#1 Awareness")
      click_on '#1 Awareness'
      click_on 'Edit Module'
      select 'THINK', :from => 'content_module_bit_core_tool_id'
      fill_in 'content_module_position', :with => '9'
      click_on 'Update'
      expect(page).to have_content 'Content module was successfully updated.'
      expect(page).to have_content 'Tool: THINK'
      click_on 'Edit Module'
      select 'DO', :from => 'content_module_bit_core_tool_id'
      fill_in 'content_module_position', :with => '2'
      click_on 'Update'
      expect(page).to have_content 'Content module was successfully updated.'
      expect(page).to have_content 'Tool: DO'
    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?("#1 Awareness")
        click_on '#1 Awareness'
        click_on 'Edit Module'
        select 'THINK', :from => 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', :with => '9'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'
        expect(page).to have_content 'Tool: THINK'
        click_on 'Edit Module'
        select 'DO', :from => 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', :with => '2'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'
        expect(page).to have_content 'Tool: DO'
      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
        click_on '#1 Awareness'
        click_on 'Edit Module'
        select 'THINK', :from => 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', :with => '9'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'
        expect(page).to have_content 'Tool: THINK'
        click_on 'Edit Module'
        select 'DO', :from => 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', :with => '2'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'
        expect(page).to have_content 'Tool: DO'
      end
    end
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
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?("Test content module")
        click_on 'Test content module'
        click_on 'Destroy'
        page.accept_alert 'Are you sure?'
        expect(page).to have_content 'Content module along with any associated tasks were successfully destroyed.'
        expect(page).to_not have_content 'Test content module'
      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
        click_on 'Test content module'
        click_on 'Destroy'
        page.accept_alert 'Are you sure?'
        expect(page).to have_content 'Content module along with any associated tasks were successfully destroyed.'
        expect(page).to_not have_content 'Test content module'
      end
    end
  end

  #Testing creating a provider
  it "- create a provider" do
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
    click_on 'New Provider'
    expect(page).to have_content 'New Content Provider'
    select 'DO: DO Activities', :from => 'content_provider_bit_core_content_module_id'
    select 'slideshow provider', :from => 'content_provider_type'
    select 'BitCore::Slideshow', :from => 'content_provider_source_content_type'
    select 'Home Introduction', :from => 'content_provider_source_content_id'
    fill_in 'content_provider_position', :with => '2'
    check 'content_provider_show_next_nav'
    check 'content_provider_is_skippable_after_first_viewing'
    click_on 'Create'
    expect(page).to have_content 'ContentProvider was successfully created.'
    expect(page).to have_content 'Tool: DO'
    expect(page).to have_content 'Module: DO Activities'
    expect(page).to have_content 'Position: 2 / 2'
    expect(page).to have_content 'Is skippable after first viewing: true'
    expect(page).to have_content 'Slideshow: Home Introduction'
  end

  #Testing destroying a provider
  it "- destroying a provider" do
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
    if page.has_text?('DO Activities')
      click_on 'DO Activities'
      expect(page).to have_content 'Edit Module'
      click_on 'slideshow provider'
      expect(page).to have_content 'Slideshow: Home Introduction'
      click_on 'Destroy'
      page.accept_alert 'Are you sure?'
      expect(page).to have_content 'Content provider was successfully destroyed.'
    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?('DO Activities')
        click_on 'DO Activities'
        expect(page).to have_content 'Edit Module'
        click_on 'slideshow provider'
        expect(page).to have_content 'Slideshow: Home Introduction'
        click_on 'Destroy'
        page.accept_alert 'Are you sure?'
        expect(page).to have_content 'Content provider was successfully destroyed.'
      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
        click_on 'DO Activities'
        expect(page).to have_content 'Edit Module'
        click_on 'slideshow provider'
        expect(page).to have_content 'Slideshow: Home Introduction'
        click_on 'Destroy'
        page.accept_alert 'Are you sure?'
        expect(page).to have_content 'Content provider was successfully destroyed.'
      end
    end
  end
end