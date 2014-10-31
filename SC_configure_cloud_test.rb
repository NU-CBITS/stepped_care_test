# filename: SC_configure_cloud_test.rb

ENV['host']             = 'test'
ENV['operating_system'] ||= 'Windows XP'
ENV['browser']          ||= 'firefox'
ENV['browser_version']  ||= '27'
ENV['SAUCE_USERNAME']   ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY'] ||= 'Your Sauce Access Key'
ENV['Generic_Participant_Email'] ||= 'SC Participant Email'
ENV['Generic_Participant_Password'] ||= 'SC Participant Password'