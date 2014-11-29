stepped_care_test
=================
This is a repo for development of automated testing which I am running on the stepped care staging app. This is a 
very new process therefore this repo will be changing drastically over time.

##Required: 
Ruby 2.0.0; Capybara 2.4.4; Sauce 3.5.3; Selenium-WebDriver 2.44.0; Sauce_Whisk 0.0.12

##Steps to take to run this test suite:

Login to steppedcare-staging as an admin:

1. Add a new Participant:
  - Study ID: 
  - Email: 
  - Password: 
2. Add a new Membership
  - Group: Access to Everything
  - Participant: choose new participant
  - Start Date: one week prior to today’s
  - End Date: today’s date plus one year
3. Add a new Coach assignment
  - Coach: choose yourself so you can see data
  - Participant: choose new participant

Seed data:

1. Send a message from participant to Coach
  - subject: I need some help with Planning an Activity
  - content: I forgot where this is.
2. Send a message from Coach to new Participant:
  - subject: GO TO INTRO
  - content: link to Introduction slideshow
3. Send a message from Coach to new Participant:
  - subject: All links
  - content: links to all other tools/slideshows except lessons
      - There is an issue in this one - Thought Distortions - needs to exist 
      - To make this exist there needs to be 3 thoughts rated with the same distortions
        - Login as new participant
        - Go to THINK > Add a New Thought
        - Put in fake data 
        - Do this 3 times, selecting the same distortion each time


##Things to know:
This is written to be used with Sauce Labs. You will need a Sauce Labs account to use this as written. Additionally 
login information for the Stepped Care staging site is needed. You will need to set the environment variables found in 
"SC_configure_cloud_saucelabs.rb" locally. This is to maintain security. 

Once these environment variables are set you will just need to run the "SC_batch.rb" file. This will run the test 
suite for every environment set in the spec_helper file.

In the batch file you can decide to run locally or on saucelabs.
