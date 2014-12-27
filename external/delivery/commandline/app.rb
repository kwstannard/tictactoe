require '../../../TTTapp/app'
require './lib/board_presenter'

@app = TTTApp.new(ENV['RACK_ENV'])
@board = @app.route "new_game"

puts BoardPresenter.build @board

def new_game
  @board = @app.route "new_game"
  puts BoardPresenter.build @board
end

def make_play(play)
  @board = @app.route("make_play", play, @board)
  puts BoardPresenter.build @board
end
