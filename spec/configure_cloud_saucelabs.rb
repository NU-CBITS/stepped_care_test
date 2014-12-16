# filename: configure_cloud_saucelabs.rb

#make sure to set these environment variables before testing
#Sauce variables are only needed if you are running the test on Sauce Labs

ENV['SAUCE_USERNAME']           ||= 'Your Sauce Username'
ENV['SAUCE_ACCESS_KEY']         ||= 'Your Sauce Access Key'
ENV['Participant_Email']        ||= 'SC Participant Email'
ENV['Participant_Password']     ||= 'SC Participant Password'
ENV['User_Email']               ||= 'SC User Email'
ENV['User_Password']            ||= 'SC User Password'
ENV['Clinician_Email']          ||= 'SC Clinician Email'
ENV['Clinician_Password']       ||= 'SC Clinician Password'
ENV['Researcher_Email']         ||= 'SC Researcher Email'
ENV['Researcher_Password']      ||= 'SC Researcher Password'
ENV['Content_Author_Email']     ||= 'SC Content Author Email'
ENV['Content_Author_Password']  ||= 'SC Content Author Password'