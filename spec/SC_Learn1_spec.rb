# filename SC_Learn1_spec.rb

require_relative 'SC_spec_helper'
require_relative '../SC_Learn1'

describe('Learn1') {

  before(:each) {
    @learn1 = Learn1.new(@driver)
  }

  it('succeeded') {
    @learn1.with(ENV['Participant_Email'], ENV['Participant_Password'])
    @learn1.select_learn
    @learn1.select_lesson_one
    4.times do
      @learn1.continue_1
    end
    @learn1.continue_2
    3.times do
      @learn1.continue_1
    end
    @learn1.success_message_present?
  }

  it('failed') {
    @learn1.with(ENV['Participant_Email'], ENV['Participant_Password'])
    @learn1.select_learn
    @learn1.select_lesson_one
    @learn1.continue_1
    @learn1.failure_message_present?
  }
}