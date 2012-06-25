class Game

  def init
    @w=4
    start_array = (1..15).to_a
    start_array << 100
    start_array = start_array.shuffle
    fill_game_field start_array
    print
  end

  def start_play
    puts "Please, enter the number"
    number = gets.chomp.to_i

    i=0
    while i<@w
      j=0
      while j<@w
        if number==@game_field[i][j]
          n_i = i
          n_j = j
        end
        if @game_field[i][j]==100
          empt_i = i
          empt_j = j
        end
        j +=1
      end
      i +=1
    end
    p n_i
    p n_j
    p empt_i
    p empt_j

    if n_j == empt_j
      shift n_i, empt_i, n_j, empt_j
    elseif n_i == empt_i
      shift n_j, empt_j, n_i, empt_i
        else
          puts "Wrong number!"
    end

    print
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
      @game_field[n_i][n_j] = 100
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

end