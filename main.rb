class Game

  def init
    @w = 4
    @left = 1
    @right = 15
    @empty_field = 0
    start_array = (@left..@right).to_a
    start_array << @empty_field
    start_array = start_array.shuffle
    fill_game_field start_array
    print
  end

  def start_play
    puts "Please, enter the number"
    number = gets.chomp.to_i

    search_elements_for_shift number


    if @user_x == @empty_x
      shift @user_y, @empty_y, @user_x, @empty_x
    end
    if @user_y == @empty_y
      shift @user_x, @empty_x, @user_y, @empty_y
    end
    if @user_x != @empty_x && @user_y != @empty_y
      puts "Wrong number!"
    end

    print
    puts "Play more? yes-1/no-2"
    answer = gets.chomp.to_i
    if answer==1
      start_play
    end
  end

  private

  def print
    @game_field.each do |cell|
        puts cell.join("\t")
    end
  end

  def shift n_i, empt_i, n_j, empt_j
    if n_i>empt_i
        razn = n_i - empt_i
       for k in empt_i..n_i-1
         @game_field[k][n_j] = @game_field[k+1][n_j]
       end
      else
        razn = empt_i - n_i
        empt_i.downto(n_i-1) do |k| @game_field[k][n_j] = @game_field[k-1][n_j] end
    end
      @game_field[n_i][n_j] = @empty_field
  end

  def fill_game_field start_array
    @game_field = []
    i=0
    k=0
    while i<@w
      j=0
      @game_field[i] = []
      while j<@w
        @game_field[i][j] = start_array[k]
        k +=1
        j +=1
      end
      i +=1
    end
  end

  def search_elements_for_shift number
    i=0
    while i<@w
      j=0
      while j<@w
        if number==@game_field[i][j]
          @user_y = i
          @user_x = j
        end
        if @game_field[i][j]==@empty_field
          @empty_y = i
          @empty_x = j
        end
        j +=1
      end
      i +=1
    end
  end

end