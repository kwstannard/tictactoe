require_relative '../../../lib/tic_tac_toe'
require 'purple_shoes'

class Button
  def initialize position, game, app, *args
    app.button *args do
      MakePlay.new.execute(position, game)
    end
  end
end

class Shoes::App
  def foo; 'hi'; end
end
class Window < Shoes
  def initialize
    @game = NewGame.new.execute
  end

  def self.run
    @app = app title: 'Tic Tac Toe', width: width, height: height do
      foo
    end
  end

  private


  def self.height; board_height + top_bar_height; end
  def self.width; board_width; end

  def self.board_width; col_width * col_count; end
  def self.board_height; row_height * row_count; end

  def self.col_width; row_height; end
  def self.col_count; 3; end
  def self.row_height; 100; end
  def self.row_count; 3; end

  def self.top_bar_height; 50; end
end

Window.run

#Shoes.app title: 'Tic Tac Toe', width: width*3, height: height*3 + top_bar do
#  background black
#
#  game = NewGame.new.execute
#
#  board_hash = {}
#
#  flow width: width*3, height: top_bar do
#  end
#
#  flow width: width*3, height: height*3 do
#    (0...3).each do |row|
#      (0...3).each do |col|
#        position = [row,col]
#        a_button = Button.new(position, game, self, '', width: width, height: height)
#        board_hash.store(position, a_button)
#      end
#    end
#  end
#end
