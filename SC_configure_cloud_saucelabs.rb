# filename: SC_configure_cloud_saucelabs.rb

#make sure to set these environment variables before testing
#Sauce variables are only needed if you are running the test on Sauce Labs

ENV['SAUCE_USERNAME']   ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY'] ||= 'Your Sauce Access Key'
ENV['Participant_Email'] ||= 'SC Participant Email'
ENV['Participant_Password'] ||= 'SC Participant Password'