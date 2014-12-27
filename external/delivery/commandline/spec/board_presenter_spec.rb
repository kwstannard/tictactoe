require '../../../TTTapp/app'
require 'board_presenter'

describe BoardPresenter do
  describe '.build' do
    let(:builder) { described_class.build(board) }
    let(:board) { {turn: player, plays: plays, winner: nil} }
    let(:player) { :red }
    let(:plays) { {red: [], blue: []} }
    let(:play) { [0,0] }

    context "new game" do
      it "has a new board" do
        builder.should eq("
OO TicTacToe OO
   |   |   
   |   |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |   
")
      end
    end

    context "blue turn" do
      let(:player) { :blue }
      it "has X's in the title instead of O" do
        builder.should eq("
XX TicTacToe XX
   |   |   
   |   |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |   
")
      end
    end

    context "red played in 0 0" do
      let(:plays) { {red: [[0,0]], blue: []} }
      it "draws an O in 0 0 " do
        builder.should eq('
OO TicTacToe OO
/ \|   |   
| ||   |   
\ /|   |   
--- --- ---
   |   |   
   |   |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |   
')
      end
    end

    context "red played in 1 1" do
      let(:plays) { {red: [[1,1]], blue: []} }
      it "draws an O in 1 1 " do
        builder.should eq('
OO TicTacToe OO
   |   |   
   |   |   
   |   |   
--- --- ---
   |/ \|   
   || ||   
   |\ /|   
--- --- ---
   |   |   
   |   |   
   |   |   
')
      end
    end

    context "blue played in 1 1" do
      let(:plays) { {red: [], blue: [[1,1]]} }
      it "draws an X in 1 1 " do
        builder.should eq('
OO TicTacToe OO
   |   |   
   |   |   
   |   |   
--- --- ---
   |\ /|   
   | X |   
   |/ \|   
--- --- ---
   |   |   
   |   |   
   |   |   
')
      end
    end
  end
end
