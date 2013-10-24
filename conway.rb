class Conway
  def board=(array)
    @board = array
  end

  def board
    @board
  end

  def to_s
    string = ''
    @board.each do |row|
      row.each do |col|
        string += col.to_s
      end
      string += "\n"
    end
    return string
  end

  def step
    temp_board = @board
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if alive_with_few_neighbors(row_index,col_index)
          p "#{row_index} #{col_index} #{temp_board[row_index][col_index]}"
          temp_board[row_index][col_index] = 0
        end
      end
    end
    @board = temp_board
  end

  def cell_alive?(cell_row, cell_col)
    @board[cell_row][cell_col] == 1
  end

  def live_neighbor_count(cell_row, cell_col)
    count = 0
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if (cell_row - row_index).abs <= 1 && (cell_col - col_index).abs <= 1
          count += col
        end
      end
    end
    count -= @board[cell_row][cell_col]
  end

  private

  def alive_with_few_neighbors(row_index,col_index)
    cell_alive?(row_index, col_index) &&
      live_neighbor_count(row_index,col_index) == 1
  end
end
