stepped_care_test
=================
This is a repo for development of automated testing which I am running on the stepped care staging app. This is a 
very new process therefore this repo will be changing drastically over time.

##Clone

    git clone https://github.com/cbitstech/stepped_care_test.git

##Steps to take to run this test suite:

###Login to steppedcare-staging as an admin:

1. Add a new Participant:
  - This needs to be linked to a real email address because you will need to go to the participant site and select
  "Forgot Your Password?" You will enter your email address and reset the password for this participant.
2. Add a new Membership
3. Add a new Coach assignment

###Seed data:

1. Send two messages from participant to Coach
  - First Message
    - subject: I need some help with Planning an Activity
    - content: I forgot where this is.
  - Second Message
    - subject: This message is a test to my coach
    - content: This message is for testing the inbox functionality on the coach dashboard.
2. Send three messages from Coach to Participant:
  - First Message
    - subject: GO TO INTRO
    - content: link to Introduction slideshow
  - Second Message
    - subject: All links
    - content: links to all other tools/slideshows except lessons
  - Third Message
    - subject: Testing sent message
    - content: This message is to a participant for testing the sent box functionality.
3. Send a site message from coach to participant
  - subject: The first message
  - content: This is a site message for testing purposes.
4. As a participant, add three harmful thoughts
  - Login as new participant
  - Navigate to THINK > Add a New Thought
  - Enter "Example thought 1", select "harmful", select "Magnifying or Minimizing", enter "Challenge", enter "As if
  Action"
  - Repeat but change entered text to "Example thought 2", "Challenge 1", "As if Action 2"
  - Repeat again changing text to "Example thought 3", "Challenge 2", "As if Action 3"

Something to note:
  The "Reviewing" test in the DO spec will run fine without seeded data, however, it won't actually test the
  functionality of the Reviewing tool. To test this functionality you will need to go to "Plan a New Activity" and plan
  two activities at least an hour prior to running this test (for a time before you will run the test).


##To run this test suite:
You will need to set the following environment variables. You will need to set user roles appropriate to Super User
(User in this test suite), Clinician, Researcher, and Content Author.

    Participant_Email; Participant_Password; User_Email; User_Password; Clinician_Email;
    Clinician_Password; Researcher_Email; Researcher_Password; Content_Author_Email;
    Content_Author_Password

To run on Sauce Labs you will need to set the following environment variables, otherwise you can run it locally on your
machine:

    SAUCE_USERNAME; SAUCE_ACCESS_KEY

To run the test suite against the staging server simply run:

    $ rspec
