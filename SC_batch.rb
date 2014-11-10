#filename: SC_batch.rb

#if running on Sauce Labs comment this block out
puts "testing locally"
system("rspec -r./SC_configure_cloud_saucelabs.rb")

#if running locally comment this block out
# puts "testing_on_saucelabs"
# system("rspec -r./SC_configure_cloud_saucelabs.rb")


#this block can be used as to run test on Sauce Labs in separate groups by platform so you can see the results by
# platform on the command line

# def set_environment_variables(host, operating_system, browser, browser_version)
#   ENV['host']= host
#   ENV['operating_system']=operating_system
#   ENV['browser']=browser
#   ENV['browser_version']=browser_version
# end

# puts "testing XP chrome 37"
# set_environment_variables 'saucelabs_XP_chrome_37','Windows XP','chrome','37'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")

# puts "testing XP firefox 32"
# set_environment_variables 'saucelabs_XP_firefox_32','Windows XP','firefox','32'
# # system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing XP ie 8"
# set_environment_variables 'saucelabs_XP_ie_8','Windows XP','internet_explorer','8'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")

# puts "testing Windows 7 chrome 37"
# set_environment_variables 'saucelabs_win7_chrome_37','Windows 7','chrome','37'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing Windows 7 firefox 32"
# set_environment_variables 'saucelabs_win7_firefox_32','Windows 7','firefox','32'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing Windows 7 ie 10"
# set_environment_variables 'saucelabs_win7_ie_10','Windows 7','internet_explorer','10'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.6 chrome 37"
# set_environment_variables 'saucelabs_osx_106_chrome_37','OS X 10.6','chrome','37'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.6 firefox 32"
# set_environment_variables 'saucelabs_osx_106_firefox_32','OS X 10.6','firefox','32'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.6 safari 5"
# set_environment_variables 'saucelabs_osx_106_safari_5','OS X 10.6','safari','5'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.8 chrome 37"
# set_environment_variables 'saucelabs_osx_108_chrome_37','OS X 10.8','chrome','37'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.8 safari 6"
# set_environment_variables 'saucelabs_osx_108_safari_6','OS X 10.8','safari','6'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.9 chrome 37"
# set_environment_variables 'saucelabs_osx_109_chrome_37','OS X 10.9','chrome','37'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.9 firefox 32"
# set_environment_variables 'saucelabs_osx_109_firefox_32','OS X 10.9','firefox','32'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.9 safari 7"
# set_environment_variables 'saucelabs_osx_109_safari_7','OS X 10.9','safari','7'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.10 chrome 37"
# set_environment_variables 'saucelabs_osx_1010_chrome_37','OS X 10.10','chrome','37'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")
#
# puts "testing OSX 10.10 firefox 32"
# set_environment_variables 'saucelabs_osx_1010_firefox_32','OS X 10.10','firefox','32'
# system("rspec -r./SC_configure_cloud_saucelabs.rb")