require 'sinatra'
require 'sinatra/json'
require 'json'
require 'slim'
require '../../../TTTapp/app'

set :slim, pretty: true

app = TTTApp.new(ENV['RACK_ENV'])
board = app.route('new_game')

get '/' do
  slim :index
end

post '/make_play' do
  spot = params[:spot]
  play = [spot[1].to_i, spot[3].to_i]
  board = app.route('make_play', play, board)
  puts board.inspect
  json board
end

post '/new_game' do
  board = app.route('new_game')
  json board
end
