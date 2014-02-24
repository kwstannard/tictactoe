require_relative '../entities/game'

class MakePlay
  def initialize(play, board)
    @play = play
    @game = Game.new(board)
  end

  def execute
    return game.to_hash if invalid_play?(play, game)

    game.add_play(play)
    game.set_winner(winner(game.plays))
    game.iterate_turn

    game.to_hash
  end

  private

  def play
    @play
  end

  def game
    @game
  end

  def invalid_play?(play, game)
    game.plays.each do |player, set|
      return true if set.include? play
    end
    false
  end

  def winner(plays)
    if has_won(plays[:red])
      :red
    elsif has_won(plays[:blue])
      :blue
    else
      nil
    end
  end

  def has_won(player_plays)
    (0..1).each do |i|
      (0..2).each do |line|
        return true if player_plays.select{|p| p[i] == line}.count == 3
      end
    end
    return true if (player_plays & [[0,0],[1,1],[2,2]]).count == 3
    return true if (player_plays & [[0,2],[1,1],[2,0]]).count == 3
    false
  end
end
