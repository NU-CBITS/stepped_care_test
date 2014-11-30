stepped_care_test
=================
This is a repo for development of automated testing which I am running on the stepped care staging app. This is a 
very new process therefore this repo will be changing drastically over time.

##Clone

    git clone https://github.com/cbitstech/stepped_care_test.git

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


##To run this test suite:
To run this test suite you will need to set the new participant login as environment variables:

    $ Participant_Email='new participant email address' ; export Participant_Email
    $ Participant_Password='new participant password'; export Participant_Password

To run the test suite on locally against the staging server simply run:

    $ rspec

To run this test suite on Sauce Labs you will need to set the environment variables found in
"SC_configure_cloud_saucelabs.rb" locally. Once the environment variables have been set, run:

    $ rspec -r./spec/SC_configure_cloud_saucelabs.rb
