# filename SC_login_spec.rb

require_relative 'SC_spec_helper'
require_relative '../SC_login'

describe('Login') {

  before(:each) {
    @login = Login.new(@driver)
  }

  it('succeeded') {
    @login.with(ENV['Generic_Participant_Email'], ENV['Generic_Participant_Password'])
    @login.success_message_present?
  }

  it('failed') {
    @login.with('asdf@test.com', 'asdf')
    @login.failure_message_present?
  }

}