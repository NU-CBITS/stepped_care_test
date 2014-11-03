# filename: SC_configure_cloud_saucelabs_XP_ie_8.rb

# just need to run this file
# requirements:
# Ruby -v 1.9.3
# install bundler
# install rspec 2.14.0
# install selenium-webdriver
# SET sauce username and access key
# SET email and password  -  example "SET Participant_email=example@example.com"

ENV['host']             = 'saucelabs_XP_ie_8'
ENV['operating_system'] ||= 'Windows XP'
ENV['browser']          ||= 'internet_explorer'
ENV['browser_version']  ||= '8'
ENV['SAUCE_USERNAME']   ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY'] ||= 'Your Sauce Access Key'
ENV['Generic_Participant_Email'] ||= 'SC Participant Email'
ENV['Generic_Participant_Password'] ||= 'SC Participant Password'

