class BoardPresenter
  def self.build(board)
    display = title(board)
    disp_board = empty_board

    board.fetch(:plays).fetch(:red).each do |play|
      disp_board = draw_circle(play, disp_board)
    end
    board.fetch(:plays).fetch(:blue).each do |play|
      disp_board = draw_cross(play, disp_board)
    end

    display += disp_board
  end

  def self.draw_cross(play, disp_board)
    disp_board[upper_left(play)] = '\\'
    disp_board[lower_left(play)] = '/'
    disp_board[middle(play)] = 'X'
    disp_board[upper_right(play)] = '/'
    disp_board[lower_right(play)] = '\\'
    disp_board
  end

  def self.draw_circle(play, disp_board)
    disp_board[upper_left(play)] = '/'
    disp_board[mid_left(play)] = '|'
    disp_board[lower_left(play)] = '\\'
    disp_board[upper_right(play)] = '\\'
    disp_board[mid_right(play)] = '|'
    disp_board[lower_right(play)] = '/'
    disp_board
  end

  def self.upper_left(play)
    4 * play[0] + 12 * 4 * play[1]
  end

  def self.mid_left(play)
    upper_left(play) + 12
  end

  def self.lower_left(play)
    mid_left(play) + 12
  end

  def self.upper_right(play)
    upper_left(play) + 2
  end

  def self.middle(play)
    mid_left(play) + 1
  end

  def self.mid_right(play)
    mid_left(play) + 2
  end

  def self.lower_right(play)
    lower_left(play) + 2
  end

  def self.empty_board
    display = ""
    3.times do
      display += row_split
      3.times do
        display += build_line
      end
    end
    display.sub(row_split, "")
  end

  def self.title(board)
    if board.fetch(:turn) == :red
      "\nOO TicTacToe OO\n"
    else
      "\nXX TicTacToe XX\n"
    end
  end

  def self.row_split
    "--- --- ---\n"
  end

  def self.build_line
    "   |   |   \n"
  end
end
