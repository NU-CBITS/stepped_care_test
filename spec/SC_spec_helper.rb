# filename: SC_spec_helper.rb

require 'capybara'
require 'sauce'
require 'sauce/capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'sauce_whisk'

Capybara.default_wait_time = 5

Capybara.default_driver = :sauce

Sauce.config do |config|

  config[:start_tunnel] = false

  def host_name_list
    ['testing_on_saucelabs', 'saucelabs_XP_ie_8', 'saucelabs_XP_firefox_32', 'saucelabs_XP_chrome_37',
     'saucelabs_win7_ie_10','saucelabs_win7_firefox_32', 'saucelabs_win7_chrome_37', 'saucelabs_osx_106_safari_5',
     'saucelabs_osx_106_firefox_32', 'saucelabs_osx_106_chrome_37', 'saucelabs_osx_108_safari_6',
     'saucelabs_osx_108_chrome_37', 'saucelabs_osx_109_safari_7', 'saucelabs_osx_109_firefox_32',
     'saucelabs_osx_109_chrome_37', 'saucelabs_osx_1010_firefox_32', 'saucelabs_osx_1010_chrome_37']
  end

  config[:browsers] = [
    # [ENV['operating_system'], ENV['browser'], ENV['browser_version']]
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

  config.after(:each) do |example|
    if host_name_list.include?(ENV['host'])
      if example.exception.nil?
        SauceWhisk::Jobs.pass_job @driver.session_id
      else
        SauceWhisk::Jobs.fail_job @driver.session_id
      end
    end
    @driver.quit
  end

end
