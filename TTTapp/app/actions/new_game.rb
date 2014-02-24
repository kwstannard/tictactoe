require_relative '../entities/game'
class NewGame
  def execute
    Game.new.to_hash
  end
end
