
module WordSearcher
  class Solver

    def initialize
      binding.pry
    end

    def start
      binding.pry
      "testing setup"
    end

    # AlgoService.new.run_word_search
    def self.run_word_search(args = {})
      @word = args.fetch(:search_word, nil)
      @word = generate_word if !@word.present?
      @puzzle = args.fetch(:puzzle, nil)
      @puzzle = generate_puzzle if !@puzzle.present?

      @word_chars = @word.chars
      @found = []
      @first_letter = @word[0]
      @coords = []
      find_coordinates
      iterate_coords
      score_hsh = check_score
    end

    def self.check_score
      remaining = @word_chars - @found
      found = @found & @word_chars
      remaining.any? ? win = false : win = true
      score_hsh = {string: @word, found: found, remaining: remaining, win: win, puzzle: @puzzle}
    end

    def self.find_coordinates
      @puzzle.each_with_index do |row, ri|
        find_col_index(row, ri)
      end
    end

    def self.find_col_index(row, ri)
      if row&.include?(@first_letter)
        ci = row.index(@first_letter)
        col = @puzzle.map { |row| row[ci] }
        coord_hsh = { row: row, col: col, ri: ri, ci: ci }
        @coords << coord_hsh
      end
    end

    def self.iterate_coords
      if @coords.any?
        @word_chars[0..-1].each do |letter|
          @coords.each do |coord|
            neighbors = get_neighbors(coord)
            neighbors = neighbors.values.flatten.uniq
            @found << letter if neighbors.include?(letter)
          end
        end
      end
    end

    def self.get_neighbors(coord)
      row_range = get_range(coord[:ri]).to_a
      col_range = get_range(coord[:ci]).to_a
      start = col_range.first
      stop = col_range.last

      neighbors = { top: @puzzle[row_range.first][start..stop],
                    mid: @puzzle[coord[:ri]][start..stop],
                    bot: @puzzle[row_range.last][start..stop]
                  }
    end

    def self.get_range(index)
      row_range = (0...7).to_a
      indexes = (index-1..index+1).to_a.map do |new_index|
        row_range.include?(new_index) ? new_index : index
      end
    end

    # def self.make_puzzle
    #   binding.pry
    #   puzzles = []
    #
    #   puzzles << { word: 'wolves',
    #          puzzle: [["a", "w", "o", "l", "v", "e", "s"],
    #                   ["s", "o", "a", "w", "a", "h", "p"],
    #                   ["i", "t", "c", "k", "e", "t", "n"],
    #                   ["o", "t", "s", "d", "h", "o", "h"],
    #                   ["s", "e", "h", "g", "s", "t", "a"],
    #                   ["u", "r", "p", "i", "w", "e", "u"],
    #                   ["z", "s", "b", "n", "u", "i", "r"]] }
    #
    #   puzzles << { word: 'wolves',
    #          puzzle: [["a", "w", "o", "l", "v", "e", "s"],
    #                   ["s", "o", "a", "w", "a", "h", "p"],
    #                   ["i", "t", "c", "k", "e", "t", "n"],
    #                   ["o", "t", "s", "d", "h", "o", "h"],
    #                   ["s", "e", "h", "g", "s", "t", "a"],
    #                   ["u", "r", "p", "i", "w", "e", "u"],
    #                   ["z", "s", "b", "n", "u", "i", "r"]] }
    #
    #   puzzle = puzzles.sample
    # end


    def self.generate_puzzle
      word = @word
      word = word.chars
      while word.length < 7
        alph = ('a'..'z').to_a.sample
        word.length.odd? ? pos = 0 : pos = -1
        word.insert(pos,alph)
      end

      puzzle = (0..7).map { ('a'..'z').to_a.shuffle[0,7] }
      n = rand(0..7)
      puzzle[n] = word
      @puzzle = puzzle
    end


    def self.generate_word
      words = %w(texas gahee adam love happy austin)
      word = words.shuffle.sample
    end




  end
end
