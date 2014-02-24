require_relative '../../entities/game'
module Memory
  class GameRepository
    def initialize
      @games_by_id = {}
      @id = 1
    end

    def new
      Game.new
    end

    def store(game)
      game.id = @id
      @games_by_id.store(game.id, game)
      @id += 1
      game
    end

    def find_by_id(id)
      @games_by_id.fetch(id)
    end
  end
end
