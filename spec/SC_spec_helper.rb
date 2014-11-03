# filename: SC_spec_helper.rb

require 'selenium-webdriver'

RSpec.configure { |config|

  config.before(:each) {
   case ENV['host']
   when 'saucelabs_XP_ie_8'
     caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
     caps.version = ENV['browser_version']
     caps.platform = ENV['operating_system']
     caps[:name] = RSpec.current_example.metadata[:full_description]

     @driver = Selenium::WebDriver.for(
         :remote,
         url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
         desired_capabilities: caps)

    when 'saucelabs_XP_firefox_32'
       caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
       caps.version = ENV['browser_version']
       caps.platform = ENV['operating_system']
       caps[:name] = RSpec.current_example.metadata[:full_description]

       @driver = Selenium::WebDriver.for(
           :remote,
           url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
           desired_capabilities: caps)

     when 'saucelabs_XP_chrome_37'
       caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
       caps.version = ENV['browser_version']
       caps.platform = ENV['operating_system']
       caps[:name] = RSpec.current_example.metadata[:full_description]

       @driver = Selenium::WebDriver.for(
           :remote,
           url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
           desired_capabilities: caps)

     when 'saucelabs_win7_ie_10'
       caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
       caps.version = ENV['browser_version']
       caps.platform = ENV['operating_system']
       caps[:name] = RSpec.current_example.metadata[:full_description]

       @driver = Selenium::WebDriver.for(
           :remote,
           url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
           desired_capabilities: caps)

     when 'saucelabs_win7_firefox_32'
       caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
       caps.version = ENV['browser_version']
       caps.platform = ENV['operating_system']
       caps[:name] = RSpec.current_example.metadata[:full_description]

       @driver = Selenium::WebDriver.for(
           :remote,
           url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
           desired_capabilities: caps)

     when 'saucelabs_win7_chrome_37'
       caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
       caps.version = ENV['browser_version']
       caps.platform = ENV['operating_system']
       caps[:name] = RSpec.current_example.metadata[:full_description]

       @driver = Selenium::WebDriver.for(
           :remote,
           url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
           desired_capabilities: caps)

     else
        @driver = Selenium::WebDriver.for :firefox
   end
  }

  config.after(:each) {
    @driver.quit
  }

}

