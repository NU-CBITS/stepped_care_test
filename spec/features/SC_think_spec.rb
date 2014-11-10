#filename: SC_think_spec,rb

#this file is to test the functionality of logging in, selecting the "LEARN" section,
# and reading through the first lesson "Think, Feel, Do Your Way Out of Depression"

require_relative '../../spec/SC_spec_helper'

#to run locally comment this line out
# describe "Think", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Think", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests
 it "- identifying" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link '#1 Identifying'
    expect(page).to have_content 'You are what you think...'
    click_link 'Continue'
    expect(page).to have_content 'Types of thoughts'
    click_link 'Continue'
    expect(page).to have_content 'Helpful thoughts are...'
    click_link 'Continue'
    expect(page).to have_content 'Harmful thoughts are...'
    click_link 'Continue'
    expect(page).to have_content 'Some quick examples...'
    click_link 'Continue'
    expect(page).to have_content 'Now, your turn...'
    within("#new_thought") do
      fill_in 'thought_content', :with => 'Testing helpful thought'
      choose('helpful')
    end
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    within("#new_thought") do
      fill_in 'thought_content', :with => 'Testing negative thought'
      choose('harmful')
    end
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    within("#new_thought") do
      fill_in 'thought_content', :with => 'Testing neither thought'
      choose('neither')
    end
    click_on 'Continue'
    expect(page).to have_content 'Now one more,'
    within("#new_thought") do
      fill_in 'thought_content', :with => 'Forced negative thought'
    end
    click_on 'Continue'
    expect(page).to have_content 'Good work'
    click_on 'Continue'
    expect(page).to have_content 'Add a New Thought'
 end

 it "- patterns" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link '#2 Patterns'
    expect(page).to have_content 'Thinking Patterns'
    click_on 'Continue'
    expect(page).to have_content 'Patterns of Harmful Thoughts'
    click_on 'Continue'
    expect(page).to have_content 'Examples of Patterns'
    click_on 'Continue'
    expect(page).to have_content 'Your Turn'
    click_on 'Continue'
    expect(page).to have_content "Let's start by"
    select 'Personalization', :from => 'thought_pattern_id'
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    select 'Magnifying or Minimizing', :from => 'thought_pattern_id'
    click_on 'Continue'
    expect(page).to have_content 'Good work!'
    click_on 'Continue'
    expect(page).to have_content 'Add a New Thought'
 end

 it "- reshape" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link '#3 Reshape'
    expect(page).to have_content 'Challenging Harmful Thoughts'
    click_on 'Continue'
    expect(page).to have_content 'You said you had the following unhelpful thoughts:'
    click_on 'Continue'
    expect(page).to have_content 'Challenging a thought means'
    click_on 'Continue'
    expect(page).to have_content 'You said that you thought...'
    click_on 'Continue'
    expect(page).to have_content 'Come up with a challenging'
    fill_in 'thought[challenging_thought]', :with => 'Example challenge'
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    expect(page).to have_content 'Because what you THINK, FEEL, Do'
    click_on 'Continue'
    expect(page).to have_content 'What could you do to ACT AS IF you believe this?'
    fill_in 'thought_act_as_if', :with => 'Example act-as-if'
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    expect(page).to have_content 'You said that you thought...'
    click_on 'Continue'
    expect(page).to have_content 'Come up with a challenging'
    fill_in 'thought[challenging_thought]', :with => 'Example challenge'
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    expect(page).to have_content 'Because what you THINK, FEEL, Do'
    click_on 'Continue'
    expect(page).to have_content 'What could you do to ACT AS IF you believe this?'
    fill_in 'thought_act_as_if', :with => 'Example act-as-if'
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
 end

 it "- add a new thought" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link 'Add a New Thought'
    expect(page).to have_content 'This thought is:'
    within("#new_thought") do
      fill_in 'thought_content', :with => 'Testing add a new thought'
      choose('harmful')
      select 'Magnifying or Minimizing', :from => 'thought_pattern_id'
      fill_in 'thought_challenging_thought', :with => 'Testing challenge thought'
      fill_in 'thought_act_as_if', :with => 'Testing act-as-if action'
    end
    click_on 'Continue'
    expect(page).to have_content 'Thought saved'
    click_on 'Continue'
    expect(page).to have_content 'Add a New Thought'
 end

 it "- check thoughts" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link 'Thoughts'
    expect(page).to have_content 'Harmful Thoughts'
    # the below reference will need to change depending on the data on the server
    expect(page).to have_content 'Testing add a new thought'
 end

  it "- skip functionality" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'Home'
    click_link '#1 Identifying'
    expect(page).to have_content 'You are what you think...'
    click_on 'Skip'
    expect(page).to have_content 'Now, your turn...'
    click_link 'THINK'
    click_link 'Home'
    click_link '#2 Patterns'
    expect(page).to have_content 'Thinking Patterns'
    click_on 'Skip'
    expect(page).to have_content "Let's start by figuring out which thought patterns the harmful thoughts you
    identified might match."
    click_link 'THINK'
    click_link 'Home'
    click_link '#3 Reshape'
    expect(page).to have_content 'Challenging Harmful Thoughts'
    click_on 'Skip'
    expect(page).to have_content "You don't have"
  end

  it "- navbar functionality" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'THINK'
    click_link 'THINK Landing'
    expect(page).to have_content 'Add a New Thought'
    click_link 'THINK'
    click_link 'Home'
    expect(page).to have_content 'Add a New Thought'
    click_link 'THINK'
    click_link '#1 Identifying'
    expect(page).to have_content 'You are what you think...'
    click_link 'THINK'
    click_link '#2 Patterns'
    expect(page).to have_content 'Thinking Patterns'
    click_link 'THINK'
    click_link '#3 Reshape'
    expect(page).to have_content 'Challenging Harmful Thoughts'
    click_link 'THINK'
    click_link 'Add a New Thought'
    expect(page).to have_content 'This thought is:'
    click_link 'THINK'
    click_link 'Thoughts'
    expect(page).to have_content 'Harmful Thoughts'
  end
end
