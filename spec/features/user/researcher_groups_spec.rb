# filename: researcher_groups_spec.rb

describe 'Researcher signs in, navigates to Groups,',
         type: :feature, sauce: sauce_labs do
  before do
    sign_in_user(ENV['Researcher_Email'], ENV['Researcher_Password'])
    click_on 'Groups'
  end

  it 'creates a group' do
    click_on 'New'
    fill_in 'group_title', with: 'Testing Group'
    select 'Arm 1', from: 'group_arm_id'
    click_on 'Create'
    expect(page).to have_content 'Group was successfully created.'
  end

  it 'updates a group' do
    click_on 'Group 1'
    click_on 'Edit'
    fill_in 'group_title', with: 'Updated Group 1'
    click_on 'Update'
    expect(page).to have_content 'Group was successfully updated.'

    expect(page).to have_content 'Title: Updated Group 1'

    click_on 'Edit'
    fill_in 'group_title', with: 'Group 1'
    click_on 'Update'
    expect(page).to have_content 'Group was successfully updated.'

    expect(page).to have_content 'Title: Group 1'
  end

  it 'destroys a group' do
    click_on 'Testing Group'
    expect(page).to have_content 'Title: Testing Group'

    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Group was successfully destroyed.'

    expect(page).to_not have_content 'Testing Group'
  end

  it 'manages tasks within a group' do
    click_on 'Group 1'
    click_on 'Manage Tasks'
    select 'LEARN: Do - Planning Slideshow 3 of 4',
           from: 'task_bit_core_content_module_id'
    fill_in 'task_release_day', with: '1'
    click_on 'Assign'
    expect(page).to have_content 'Task assigned.'

    within('tr', text: 'LEARN: Do - Planning Slideshow 3 of 4') do
      click_on 'Unassign'
    end

    page.accept_alert 'Are you sure?'
    within '#tasks' do
      expect(page).to_not have_content 'LEARN: Do - Planning Slideshow 3 of 4'
    end
  end

  it 'uses breadcrumbs to return to home' do
    within('.breadcrumb') do
      click_on 'Home'
    end

    expect(page).to have_content 'Arms'
  end
end
