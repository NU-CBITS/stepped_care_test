# filename: SC_configure_cloud_saucelabs_win7_chrome_37.rb

ENV['host']             = 'saucelabs_win7_chrome_37'
ENV['operating_system'] ||= 'Windows 7'
ENV['browser']          ||= 'chrome'
ENV['browser_version']  ||= '37'
ENV['SAUCE_USERNAME']   ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY'] ||= 'Your Sauce Access Key'
ENV['Generic_Participant_Email'] ||= 'SC Participant Email'
ENV['Generic_Participant_Password'] ||= 'SC Participant Password'