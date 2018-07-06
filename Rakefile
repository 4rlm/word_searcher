require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'word_searcher'
# require 'webs_criteria'


RSpec::Core::RakeTask.new(:spec)

task :default => :spec
task :test => :spec

###################
task :console do
  require 'irb'
  require 'irb/completion'
  require 'word_searcher'
  require "active_support/all"
  ARGV.clear

  scraped_links = run_word_searcher
  # binding.pry

  IRB.start
end


def run_word_searcher
  binding.pry
  searched = WordSearcher::Solver.new
  res = searched.start
  binding.pry

  # scraper = LinkScraper::Scrape.new({text_criteria: text_criteria, path_criteria: path_criteria})
  # scraped_links = scraper.start('https://en.wikipedia.org/wiki/Austin%2C_Texas')
  # binding.pry

  # scraper = LinkScraper::Scrape.new(WebsCriteria.all_scrub_web_criteria)
end
