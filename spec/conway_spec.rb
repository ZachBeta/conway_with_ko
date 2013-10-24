require 'spec_helper'
require './conway'

describe Conway do
  let(:conway) { Conway.new }

  describe '#step' do
    it 'handles step suches' do
      conway.board = [[1,0],
                      [0,0]]
      conway.step
      conway.board.should == [[0,0],
                              [0,0]]

      conway.board = [[0,0,0],
                      [1,1,1],
                      [0,0,0]]
      p conway.live_neighbor_count(1,1)
      conway.step
      p conway.board
      conway.cell_alive?(1,2).should == false
      conway.cell_alive?(1,1).should == true
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
