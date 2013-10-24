require 'spec_helper'
require './conway'

describe Conway do
  let(:conway) { Conway.new }

  describe '#step' do
    context 'given too few neighbors' do
      it 'kills' do
        conway.board = [[1,0,0],
                        [0,0,0]]
        conway.step
        conway.board.should == [[0,0,0],
                                [0,0,0]]

        conway.board = [[0,0,0],
                        [1,1,1],
                        [0,0,0]]
        conway.step
        conway.cell_alive?(1,2).should == false
        conway.cell_alive?(1,1).should == true
      end
    end

    context 'given too many neighbbors' do
      before do
        conway.board = [[1,1,0],
                        [1,1,1],
                        [0,0,0]]

        conway.step
      end

      it 'kills' do
        conway.cell_alive?(1,1).should == false
      end

      it "doesn't kill other stuff" do
        conway.cell_alive?(0,0).should == true
        conway.cell_alive?(1,2).should == true
      end
    end

    context 'given dead cell with exactly three neighbors' do
      it 'births' do
        conway.board = [[0,1,0],
                        [1,0,1],
                        [0,0,0]]
        conway.step
        p conway.board[1][1]
        conway.cell_alive?(1,1) == true
      end
    end
  end

  describe '#cell_alive?' do
    context 'given a live cell with 1' do
      it 'returns true' do
        conway.board = [[1,0],
                        [0,0]]
        conway.cell_alive?(0,0).should == true
        conway.cell_alive?(1,1).should == false
      end
    end
  end

  describe '#live_neighbor_count' do
    it 'counts live neighbors for a cell' do
      conway.board = [[1,0],
                      [0,0]]

      conway.live_neighbor_count(0,0).should == 0
      conway.live_neighbor_count(1,1).should == 1

      conway.board = [[1,1],
                      [1,0]]

      conway.live_neighbor_count(0,0).should == 2
      conway.live_neighbor_count(1,1).should == 3

      conway.board = [[1,1,1],
                      [1,1,1],
                      [1,1,1]]

      conway.live_neighbor_count(0,0).should == 3
      conway.live_neighbor_count(1,1).should == 8
      conway.live_neighbor_count(0,1).should == 5

      conway.board = [[0,0,0],
                      [1,1,1],
                      [0,0,0]]

      conway.live_neighbor_count(1,1).should == 2
    end
  end


  it 'generates a string' do
    conway.board = [[1,0],
                    [0,1]]
    conway.to_s.should == "10\n01\n"

    conway.board = [[0,0],
                    [0,1]]
    conway.to_s.should == "00\n01\n"
  end
end
