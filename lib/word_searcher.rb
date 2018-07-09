require "word_searcher/version"

require "word_searcher/solver"
# require 'mechanizer'
# require 'scrub_db'
require 'pry'

module WordSearcher

  def self.search(args={})
    results = self::Solver.new.search(args)
  end


end
