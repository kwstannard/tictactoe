require_relative '../../app/actions/make_play'

describe MakePlay do
  let(:result) { described_class.new(play, board).execute }
  let(:board) { {turn: player, plays: plays, winner: nil} }
  let(:player) { :red }
  let(:plays) { {red: [], blue: []} }
  let(:play) { [0,0] }

  context 'when player plays on already existing square' do
    let(:plays) { {red: [[0,0]], blue: []} }
    it 'returns the original board' do
      result.should eq(board)
    end
  end

  context 'when red plays 0, 0' do
    it 'adds the play to reds list of plays' do
      result[:plays][:red].should eq [play]
    end

    it 'switches the turn' do
      result[:turn].should eq :blue
    end
  end

  context 'when blue plays 0, 0' do
    let(:player) { :blue }
    it 'adds the play to reds list of plays' do
      result[:plays][:blue].should eq [play]
    end

    it 'switches the turn' do
      result[:turn].should eq :red
    end
  end

  context 'when red wins the game' do
    let(:plays) { {red: [[0,1], [0,2]], blue: [[1,1], [1,2]]} }
    it 'shows red as the winner' do
      result[:winner].should eq :red
    end

    context 'when play is on a diagonal' do
      let(:plays) { {red: [[1,1], [2,2]], blue: [[0,1], [1,2]]} }
      let(:play) { [0,0] }
      it 'shows blue as the winner' do
        result[:winner].should eq :red
      end
    end
  end

  context 'when blue wins the game' do
    let(:plays) { {red: [[0,1], [0,2]], blue: [[1,1], [1,2]]} }
    let(:player) { :blue }
    let(:play) { [1,0] }
    it 'shows blue as the winner' do
      result[:winner].should eq :blue
    end

    context 'when play is on a diagonal' do
      let(:plays) { {red: [[0,1], [0,2]], blue: [[1,1], [2,2]]} }
      let(:play) { [0,0] }
      it 'shows blue as the winner' do
        result[:winner].should eq :blue
      end
    end
  end

  context 'when no one wins with a move' do
    it 'shows nil as the winner' do
      result[:winner].should be_nil
    end
  end
end
