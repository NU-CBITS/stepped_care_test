# filename: SC_spec_helper.rb

require 'selenium-webdriver'

RSpec.configure { |config|

  config.before(:each) {
    @driver=nil
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

      when 'saucelabs_osx_106_safari_5'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_106_firefox_32'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_106_chrome_37'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_108_safari_6'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_108_chrome_37'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_109_safari_7'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_109_firefox_32'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_109_chrome_37'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_1010_firefox_32'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      when 'saucelabs_osx_1010_chrome_37'
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV['browser'])
        caps.version = ENV['browser_version']
        caps.platform = ENV['operating_system']
        caps[:name] = RSpec.current_example.metadata[:full_description]

        @driver = Selenium::WebDriver.for(
          :remote,
          url: "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          desired_capabilities: caps)

      else
        puts "in the else statement the host is"
        puts ENV['host']
        @driver = Selenium::WebDriver.for :firefox

    end
    @driver.manage.timeouts.implicit_wait = 10
  }

  config.after(:each) {
    @driver.quit
  }

}

