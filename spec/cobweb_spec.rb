require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require_relative 'configure_cloud'
require '/Users/Chris/.rvm/gems/ruby-2.2.0/gems/cobweb-1.0.25/lib/cobweb.rb'
require 'redis'

describe 'cobweb', type: :feature do
  it '- crawls without login' do
    statistics = CobwebCrawler.new(cache: 600).crawl(ENV['Base_URL']) do |page|
      puts "Just crawled #{page[:url]} and got a status of #{page[:status_code]}."
    end.get_statistics
    puts "Finished Crawl without login with #{statistics[:page_count]} pages and #{statistics[:asset_count]} assets."
  end
end
