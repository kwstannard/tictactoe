require_relative '../../../app/repositories/memory/game_repository'
describe Memory::GameRepository do
  describe '#new' do
    it 'returns a new game' do
      described_class.new.new.should be_a(Game)
    end
  end

  it "stores things in memory for later" do
    repo = described_class.new
    game = Game.new
    repo.store(game)
    repo.find_by_id(game.id).should eq(game)
  end
end
