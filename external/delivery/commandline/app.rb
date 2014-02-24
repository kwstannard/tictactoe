require '../../../TTTapp/app'
require './lib/board_builder'

@app = TTTApp.new
@app.set_up(ENV['RACK_ENV'])
@board = @app.new_game

puts BoardBuilder.build @board

def new_game
  @board = @app.new_game
  puts BoardBuilder.build @board
end

def make_play(play)
  @board = @app.make_play(play, @board)
  puts BoardBuilder.build @board
end
