# filename: SC_configure_cloud_saucelabs.rb

require 'sauce_whisk'

ENV['SAUCE_USERNAME']   ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY'] ||= 'Your Sauce Access Key'
ENV['Participant_Email'] ||= 'SC Participant Email'
ENV['Participant_Password'] ||= 'SC Participant Password'