# filename SC_Learn1.rb

class Learn1
  LOGIN_FORM = { css: '.btn.btn-default' }
  USERNAME_INPUT = { id: 'participant_email' }
  PASSWORD_INPUT = { id: 'participant_password' }
  LOGIN_SUCCESS = { css:  '.fa.fa-flag.text-success' }
  LEARN_PAGE = { css: '.LEARN.hidden-xs' }
  LESSON_ONE = {id: 'task-status-1029739760'}
  CONTINUE_BUTTON = { css: '.btn.btn-primary.pull-right' }
  SUCCESS_MESSAGE = { id: 'task-status-1029739760' }
  FAILURE_MESSAGE = { xpath: '//html/body/div[1]/div[1]/div/div[2]/div[2]/div/h1'}

  def  initialize(driver)
    @driver = driver
    @driver.get 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    @driver.find_element(LOGIN_FORM).displayed?
  end

  def with(participant_email, participant_password)
    @driver.find_element(USERNAME_INPUT).send_keys(participant_email)
    @driver.find_element(PASSWORD_INPUT).send_keys(participant_password)
    @driver.find_element(LOGIN_FORM).submit
    @driver.find_element(LOGIN_SUCCESS).displayed?
  end

  def select_learn
    @driver.find_element(LEARN_PAGE).click
    @driver.find_element(xpath: '//html/body/div[1]/div[1]/div/div[2]/div[2]/div/h1').displayed?
  end

  def select_lesson_one
    @driver.find_element(LESSON_ONE).click
    @driver.find_element(xpath: '//html/body/div[1]/div[1]/div/div[2]/div[2]/div/h1').displayed?
  end

  def continue_1
    @driver.find_element(CONTINUE_BUTTON).click
    @driver.find_element(xpath: '//html/body/div[1]/div[1]/div/div[2]/div[2]/div/h1').displayed?
  end

  def continue_2
    @driver.find_element(CONTINUE_BUTTON).click
    @driver.find_element(xpath: '//html/body/div[1]/div[1]/div/div[2]/div[2]/p[1]').displayed?
  end

  def success_message_present?
    @driver.find_element(SUCCESS_MESSAGE).displayed?
  end

  def failure_message_present?
    @driver.find_element(FAILURE_MESSAGE).displayed?
  end
end