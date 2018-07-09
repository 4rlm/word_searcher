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

  result = run_word_searcher
  binding.pry

  IRB.start
end


def run_word_searcher
  word = 'austin'
  result = WordSearcher.search(word: word)

  # scraper = LinkScraper::Scrape.new(WebsCriteria.all_scrub_web_criteria)
end
