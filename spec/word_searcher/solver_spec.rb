# rspec spec/word_searcher/solver_spec.rb

require 'spec_helper'

describe 'Solver' do
  let(:solver_obj) { WordSearcher::Solver.new }
  # before { solver_obj.inst = inst }

  # describe '#search' do
  #   let(:args) { {:word=>"austin"} }
  #   let(:score_hsh) {}
  #
  #   it 'search' do
  #     expect(solver_obj.search(args)).to eql(score_hsh)
  #   end
  # end

  describe '#find_col_index' do
    let(:row) { ["r", "d", "x", "n", "e", "k", "j"] }
    let(:ri) { 0 }
    let(:coords) { [] }

    it 'find_col_index' do
      expect(solver_obj.find_col_index(row, ri)).to eql(coords)
    end
  end

  # describe '#iterate_coords' do
  #   before do
  #     solver_obj.coords = [{:row=>["a", "u", "s", "t", "i", "n", "j"], :col=>["c", "t", "p", "n", "a", "g", "k", "s"], :ri=>4, :ci=>0}],
  #     solver_obj.word_chars = ["a", "u", "s", "t", "i", "n"]
  #   end
  #
  #   let(:output) {}
  #
  #   it 'iterate_coords' do
  #     expect(solver_obj.iterate_coords).to eql(output)
  #   end
  # end

  describe '#get_neighbors' do
    before do
      solver_obj.puzzle = [
        ["j", "i", "y", "q", "a", "n", "o"],
        ["q", "o", "h", "g", "j", "b", "a"],
        ["k", "x", "i", "t", "w", "y", "h"],
        ["v", "g", "o", "x", "n", "t", "w"],
        ["n", "c", "r", "x", "i", "b", "h"],
        ["a", "u", "s", "t", "i", "n", "m"],
        ["h", "l", "o", "k", "s", "u", "x"],
        ["e", "g", "a", "p", "q", "m", "r"]
      ]
    end

    let(:coord) do
      {
        :row=>["j", "i", "y", "q", "a", "n", "o"],
        :col=>["a", "j", "w", "n", "i", "i", "s", "q"],
        :ri=>0,
        :ci=>4
      }
    end
    let(:neighbors) do
      {:top=>["q", "a", "n"], :mid=>["q", "a", "n"], :bot=>["g", "j", "b"]}
    end

    it 'get_neighbors' do
      expect(solver_obj.get_neighbors(coord)).to eql(neighbors)
    end
  end

  describe '#get_range' do
    let(:index) { 2 }
    let(:indexes) { [1, 2, 3] }

    it 'get_range' do
      expect(solver_obj.get_range(index)).to eql(indexes)
    end
  end

  # describe '#generate_puzzle' do
  #   before {solver_obj.word = "austin" }
  #   let(:puzzle) {}
  #
  #   it 'generate_puzzle' do
  #     expect(solver_obj.generate_puzzle).to eql(puzzle)
  #   end
  # end

end
