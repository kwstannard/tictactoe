require 'sinatra'
require 'sinatra/json'
require 'json'
require 'slim'
require '../../../TTTapp/app'

set :slim, pretty: true

app = TTTApp.new
app.set_up(ENV['RACK_ENV'])
board = app.new_game

get '/' do
  slim :index
end

post '/make_play' do
  spot = params[:spot]
  play = [spot[1].to_i, spot[3].to_i]
  board = app.make_play(play, board)
  puts board.inspect
  json board
end

post '/new_game' do
  app.new_game
  json board
end
