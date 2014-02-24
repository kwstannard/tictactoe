require_relative '../../app/actions/new_game'

describe NewGame do
  it 'starts a new game' do
    hash = { turn: :red, plays: {red: [], blue: []}, winner: nil }
    result = NewGame.new.execute
    result.should eq( hash )
  end
end
