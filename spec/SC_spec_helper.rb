# filename: SC_spec_helper.rb

require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'sauce'
require 'sauce/capybara'
require 'sauce_whisk'

Capybara.default_wait_time = 30

Capybara.default_driver = :sauce

Sauce.config do |config|

  config[:start_tunnel] = false

  config[:browsers] = [
    ["Windows XP", "Internet Explorer", "8"],
    ["Windows XP", "Firefox", "32"],
    ["Windows XP", "Chrome", "37"],
    ["Windows 7", "Internet Explorer", "10"],
    ["Windows 7", "Firefox", "32"],
    ["Windows 7", "Chrome", "37"],
    ["OS X 10.6", "Firefox", "32"],
    ["OS X 10.6", "Chrome", "37"],
    ["OS X 10.6", "Safari", "5"],
    ["OS X 10.6", "Chrome", "37"],
    ["OS X 10.8", "Safari", "6"],
    ["OS X 10.9", "Firefox", "32"],
    ["OS X 10.9", "Chrome", "37"],
    ["OS X 10.9", "Safari", "7"],
    ["OS X 10.10", "Firefox", "32"],
    ["OS X 10.10", "Chrome", "37"]
  ]

  config[:each] do |example|
      if example.exception.nil?
        SauceWhisk::Jobs.pass_job @driver.session_id
      else
        SauceWhisk::Jobs.fail_job @driver.session_id
      end
    @driver.quit
  end

end
