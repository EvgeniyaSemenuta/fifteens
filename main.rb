class Game

  def init
    w=4
    start_array = (1..15).to_a
    start_array << 100
    start_array = start_array.shuffle
    @game_field = []
    i=0
    k=0
    while i<w
      j=0
      @game_field[i] = []
      while j<w
        @game_field[i][j] = start_array[k]
        k +=1
        j +=1
      end
      i +=1
    end
    print
  end

  def print
    @game_field.each do |cell|
        puts cell.join("\t")
    end
  end


end