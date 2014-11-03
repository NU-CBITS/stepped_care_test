# filename: SC_configure_cloud_saucelabs_win7_firefox_32.rb

ENV['host']             = 'saucelabs_win7_firefox_32'
ENV['operating_system'] ||= 'Windows 7'
ENV['browser']          ||= 'firefox'
ENV['browser_version']  ||= '32'
ENV['SAUCE_USERNAME']   ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY'] ||= 'Your Sauce Access Key'
ENV['Generic_Participant_Email'] ||= 'SC Participant Email'
ENV['Generic_Participant_Password'] ||= 'SC Participant Password'