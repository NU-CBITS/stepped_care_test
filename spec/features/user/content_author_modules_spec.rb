# filename: content_author_modules_spec.rb

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Content Author, Modules', type: :feature, sauce: sauce_labs do
  before(:each) do
    visit ENV['Base_URL'] + '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: ENV['User_Email']
      fill_in 'user_password', with: ENV['User_Password']
    end

    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    click_on 'Arms'
    expect(page).to have_content 'Listing Arms'

    click_on 'Arm 1'
    expect(page).to have_content 'Title: Arm 1'

    click_on 'Manage Content'
    click_on 'Content Modules'
    expect(page).to have_content 'Listing Content Modules'
  end

  # tests
  # Testing creating a module
  it '- new module' do
    click_on 'New'
    expect(page).to have_content 'New Content Module'

    fill_in 'content_module_title', with: 'Test content module'
    select 'THINK', from: 'content_module_bit_core_tool_id'
    fill_in 'content_module_position', with: '8'
    click_on 'Create'
    expect(page).to have_content 'Content module was successfully created.'

    expect(page).to have_content 'Position: 8 / 8'
  end

  # Testing updating a module
  it '- edit module' do
    if page.has_text?('#1 Awareness')
      click_on '#1 Awareness'
      click_on 'Edit'
      select 'THINK', from: 'content_module_bit_core_tool_id'
      fill_in 'content_module_position', with: '9'
      click_on 'Update'
      expect(page).to have_content 'Content module was successfully updated.'

      expect(page).to have_content 'Tool: THINK'

      click_on 'Edit'
      select 'DO', from: 'content_module_bit_core_tool_id'
      fill_in 'content_module_position', with: '2'
      click_on 'Update'
      expect(page).to have_content 'Content module was successfully updated.'

      expect(page).to have_content 'Tool: DO'
    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?('#1 Awareness')
        click_on '#1 Awareness'
        click_on 'Edit'
        select 'THINK', from: 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', with: '9'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'

        expect(page).to have_content 'Tool: THINK'

        click_on 'Edit'
        select 'DO', from: 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', with: '2'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'

        expect(page).to have_content 'Tool: DO'

      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
        click_on '#1 Awareness'
        click_on 'Edit'
        select 'THINK', from: 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', with: '9'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'

        expect(page).to have_content 'Tool: THINK'

        click_on 'Edit'
        select 'DO', from: 'content_module_bit_core_tool_id'
        fill_in 'content_module_position', with: '2'
        click_on 'Update'
        expect(page).to have_content 'Content module was successfully updated.'

        expect(page).to have_content 'Tool: DO'
      end
    end
  end

  # Testing destroying a module
  it '- destroy module' do
    if page.has_text?('Test content module')
      click_on 'Test content module'
      click_on 'Destroy'
      page.accept_alert 'Are you sure?'
      expect(page).to have_content 'Content module along with any associated tasks were successfully destroyed.'

      expect(page).to_not have_content 'Test content module'

    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?('Test content module')
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

  # Testing creating a provider
  it '- create a provider' do
    click_on 'New Provider'
    expect(page).to have_content 'New Content Provider'

    select 'LEARN: Testing adding/updating slides/lessons', from: 'content_provider_bit_core_content_module_id'
    select 'slideshow provider', from: 'content_provider_type'
    select 'BitCore::Slideshow', from: 'content_provider_source_content_type'
    select 'Home Introduction', from: 'content_provider_source_content_id'
    fill_in 'content_provider_position', with: '4'
    check 'content_provider_show_next_nav'
    check 'content_provider_is_skippable_after_first_viewing'
    click_on 'Create'
    expect(page).to have_content 'ContentProvider was successfully created.'

    expect(page).to have_content 'Tool: LEARN'

    expect(page).to have_content 'Module: Testing adding/updating slides/lessons'

    expect(page).to have_content 'Position: 4 / 4'

    expect(page).to have_content 'Is skippable after first viewing: true'

    expect(page).to have_content 'Slideshow: Home Introduction'
  end

  # Testing updating a provider
  it '- updating a provider' do
    if page.has_text?('Testing adding/updating slides/lessons')
      click_on 'Testing adding/updating slides/lessons'
      expect(page).to have_content 'New Provider'

      click_on '1 slideshow provider'
      expect(page).to have_content 'Content Provider'

      expect(page).to have_content 'Slideshow: Testing adding/updating slides/lessons'

      click_on 'Edit'
      expect(page).to have_content 'Editing'

      fill_in 'content_provider_position', with: '10'
      click_on 'Update'
      expect(page).to have_content 'ContentProvider was successfully updated.'

      expect(page).to have_content 'Position: 10 / 10'

      click_on 'Edit'
      expect(page).to have_content 'Editing'

      fill_in 'content_provider_position', with: '1'
      click_on 'Update'
      expect(page).to have_content 'ContentProvider was successfully updated.'

      expect(page).to have_content 'Position: 1 / 4'
    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?('Testing adding/updating slides/lessons')
        click_on 'Testing adding/updating slides/lessons'
        expect(page).to have_content 'New Provider'

        click_on '1 slideshow provider'
        expect(page).to have_content 'Content Provider'

        expect(page).to have_content 'Slideshow: Testing adding/updating slides/lessons'

        click_on 'Edit'
        expect(page).to have_content 'Editing'

        fill_in 'content_provider_position', with: '10'
        click_on 'Update'
        expect(page).to have_content 'ContentProvider was successfully updated.'

        expect(page).to have_content 'Position: 10 / 10'

        click_on 'Edit'
        expect(page).to have_content 'Editing'

        fill_in 'content_provider_position', with: '1'
        click_on 'Update'
        expect(page).to have_content 'ContentProvider was successfully updated.'

        expect(page).to have_content 'Position: 1 / 4'
      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
        click_on 'Testing adding/updating slides/lessons'
        expect(page).to have_content 'New Provider'

        click_on '1 slideshow provider'
        expect(page).to have_content 'Content Provider'

        expect(page).to have_content 'Slideshow: Testing adding/updating slides/lessons'

        click_on 'Edit'
        expect(page).to have_content 'Editing'

        fill_in 'content_provider_position', with: '10'
        click_on 'Update'
        expect(page).to have_content 'ContentProvider was successfully updated.'

        expect(page).to have_content 'Position: 10 / 10'

        click_on 'Edit'
        expect(page).to have_content 'Editing'

        fill_in 'content_provider_position', with: '1'
        click_on 'Update'
        expect(page).to have_content 'ContentProvider was successfully updated.'

        expect(page).to have_content 'Position: 1 / 4'
      end
    end
  end

  # Testing destroying a provider
  it '- destroying a provider' do
    if page.has_text?('Testing adding/updating slides/lessons')
      click_on 'Testing adding/updating slides/lessons'
      expect(page).to have_content 'Edit'

      click_on '4 slideshow provider'
      expect(page).to have_content 'Slideshow: Home Introduction'

      click_on 'Destroy'
      page.accept_alert 'Are you sure?'
      expect(page).to have_content 'Content provider was successfully destroyed.'

    else
      find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[3]').click
      if page.has_text?('Testing adding/updating slides/lessons')
        click_on 'Testing adding/updating slides/lessons'
        expect(page).to have_content 'Edit'

        click_on '4 slideshow provider'
        expect(page).to have_content 'Slideshow: Home Introduction'

        click_on 'Destroy'
        page.accept_alert 'Are you sure?'
        expect(page).to have_content 'Content provider was successfully destroyed.'

      else
        find(:xpath, 'html/body/div[1]/div/div/div[2]/div[2]/div[2]/div[2]/div/ul/li[4]').click
        click_on 'Testing adding/updating slides/lessons'
        expect(page).to have_content 'Edit'

        click_on '4 slideshow provider'
        expect(page).to have_content 'Slideshow: Home Introduction'

        click_on 'Destroy'
        page.accept_alert 'Are you sure?'
        expect(page).to have_content 'Content provider was successfully destroyed.'
      end
    end
  end
end
