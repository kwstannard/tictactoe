class Game
  attr_accessor :id, :board
  def initialize(board = nil)
    @board = board || { turn: :red, plays: {red: [], blue: []}, winner: nil }
  end

  def to_hash
    @board
  end

  def iterate_turn
    @board.store(:turn, next_player)
  end

  def set_winner(player)
    @board.store(:winner, player)
  end

  def plays
    @board.fetch(:plays)
  end

  def add_play(play)
    @board.fetch(:plays).fetch(turn).push(play)
  end

  def turn
    @board.fetch(:turn)
  end

  def next_player
    if turn == :red
      :blue
    else
      :red
    end
  end
end
