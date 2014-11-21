#filename: SC_batch.rb

#if running on Sauce Labs comment this block out
puts "testing locally"
system("rspec -r./spec/features/SC_do_spec.rb")

#if running locally comment this block out
# puts "testing_on_saucelabs"
# system("rspec -r./SC_configure_cloud_saucelabs.rb")


