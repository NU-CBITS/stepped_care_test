stepped_care_test
=================
This is a repo for development of automated testing which I am running on the stepped care staging app.
This is a very new process therefore this repo will be changing drastically over time.

Required:
Ruby 1.9.3
Selenium-WebDriver 2.43.0
Sauce_Whisk 0.0.15

This is written to be used with Sauce Labs. You will need a Sauce Labs account to use this as written. Additionally 
login information for the Stepped Care staging site is needed. You will need to set the environment variables found in 
"SC_configure_cloud_saucelabs.rb" locally. This is to maintain security. 

Once these environment variables are set you will just need to run the "SC_batch.rb" file. This will run the test 
suite for every environment set in the batch file. You should comment out all but one environment while tweaking and 
running the rest of the files. 
