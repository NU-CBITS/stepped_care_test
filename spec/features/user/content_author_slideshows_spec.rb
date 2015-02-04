# filename: content_author_slideshows_spec.rb

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Content Author, Slideshows', type: :feature, sauce: sauce_labs do
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
    click_on 'Slideshows'
  end

  # tests
  # Testing creating a slideshow
  it '- new slideshow' do
    expect(page).to have_content 'Listing Slideshows'

    click_on 'New'
    expect(page).to have_content 'New Slideshow'

    fill_in 'slideshow_title', with: 'Test slideshow'
    click_on 'Create'
    expect(page).to have_content 'Successfully created slideshow'

    expect(page).to have_content 'Test slideshow'
  end

  # Testing updating a slideshow
  it '- update slideshow' do
    click_on 'Testing adding/updating slides/lessons'
    expect(page).to have_content 'Slideshow'

    expect(page).to have_content 'Testing adding/updating slides/lessons'

    expect(page).to have_content 'Anchors'

    find(:xpath, 'html/body/div[1]/div/div/div[2]/div[1]/a[4]').click
    expect(page).to have_content 'Edit Slideshow'

    fill_in 'slideshow_title', with: 'Testing adding/updating slides/lessons 123'
    click_on 'Update'
    expect(page).to have_content 'Successfully updated slideshow'

    click_on 'Testing adding/updating slides/lessons 123'
    expect(page).to have_content 'Slideshow'

    expect(page).to have_content 'Testing adding/updating slides/lessons 123'

    expect(page).to have_content 'Anchors'

    find(:xpath, 'html/body/div[1]/div/div/div[2]/div[1]/a[4]').click
    expect(page).to have_content 'Edit Slideshow'

    fill_in 'slideshow_title', with: 'Testing adding/updating slides/lessons'
    click_on 'Update'
    expect(page).to have_content 'Successfully updated slideshow'
  end

  # Testing destroying a slideshow
  it '- destroy slideshow' do
    click_on 'Test slideshow'
    click_on 'Delete'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Slideshow deleted'

    expect(page).to_not have_content 'Test slideshow'
  end
end
