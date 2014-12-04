stepped_care_test
=================
This is a repo for development of automated testing which I am running on the stepped care staging app. This is a 
very new process therefore this repo will be changing drastically over time.

##Clone

    git clone https://github.com/cbitstech/stepped_care_test.git

##Steps to take to run this test suite:

###Login to steppedcare-staging as an admin:

1. Add a new Participant:
  - Study ID: 
  - Email:
  - This needs to be linked to a real email address because you will need to go to the participant site and select "Forgot Your Password?" You will enter your email address and reset the password for this participant.
2. Add a new Membership
  - Group: Access to Everything
  - Participant: choose new participant
  - Start Date: one week prior to today’s
  - End Date: today’s date plus one year
3. Add a new Coach assignment
  - Coach: choose yourself so you can see data
  - Participant: choose new participant

###Seed data:

1. Send a message from participant to Coach
  - subject: I need some help with Planning an Activity
  - content: I forgot where this is.
2. Send a message from Coach to new Participant:
  - subject: GO TO INTRO
  - content: link to Introduction slideshow
3. Send a message from Coach to new Participant:
  - subject: All links
  - content: links to all other tools/slideshows except lessons
4. Add three harmful thoughts
  - Login as new participant
  - Navigate to THINK > Add a New Thought
  - Enter "Example thought 1", select "harmful", select "Magnifying or Minimizing", enter "Challenge", enter "As if Action"
  - Repeat but change entered text to "Example thought 2", "Challenge 1", "As if Action 2"
  - Repeat again changing text to "Example thought 3", "Challenge 2", "As if Action 3"

Something to note:
  The "Reviewing" test in the DO spec will run fine without seeded data, however, it won't actually test the
  functionality of the Reviewing tool. To test this functionality you will need to go to "Plan a New Activity" and plan
  two activities at least an hour prior to running this test (for a time before you will run the test).


##To run this test suite:
To run this test suite you will need to set the new participant login as environment variables:

    $ export Participant_Email='new participant email address'
    $ export Participant_Password='new participant password'

To run this test suite on Sauce Labs you will need to set the following environment variables:

    $ export SAUCE_USERNAME='sauce username'
    $ export SAUCE_ACCESS_KEY='sauce access key'

To run the test suite against the staging server simply run:

    $ rspec
