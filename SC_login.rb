# filename SC_login.rb
class Login
  LOGIN_FORM = { css: '.btn.btn-default' }
  USERNAME_INPUT = { id: 'participant_email' }
  PASSWORD_INPUT = { id: 'participant_password' }
  SUCCESS_MESSAGE = { id: 'sc-hamburger-menu' }
  FAILURE_MESSAGE = { css: '.btn.btn-default' }

  def  initialize(driver)
    @driver = driver
    @driver.get 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    @driver.find_element(LOGIN_FORM).displayed?
  end

  def with(participant_email, participant_password)
    @driver.find_element(USERNAME_INPUT).send_keys(participant_email)
    @driver.find_element(PASSWORD_INPUT).send_keys(participant_password)
    @driver.find_element(LOGIN_FORM).submit
  end

  def success_message_present?
    @driver.find_element(SUCCESS_MESSAGE).displayed?
  end

  def failure_message_present?
    @driver.find_element(FAILURE_MESSAGE).displayed?
  end

end
