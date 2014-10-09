class Spiral
  def initialize(start,width)
    @count = start
    @width = width
    @stop_number = (@width*@width) + (@count -1)
    @final_arr = []
    @width.times do
      arr = []
      @width.times { arr << nil }
      @final_arr << arr
    end
    @contraction = 0
  end

  def init
    build_sides(0,0,0)
  end

  def build_sides(side, x_coord, y_coord)
    return @final_arr if @count > @stop_number

    y = y_coord
    x = x_coord
    side = side

    if side == 0

      if @contraction == 0
        (@width - @contraction).times do
          @final_arr[y][x] = @count
          x += 1
          @count += 1
        end
        x -= 1
      else
        (@width - @contraction).times do
          x += 1
          @final_arr[y][x] = @count
          @count += 1
        end
      end
      @contraction += 1

    elsif side == 1
      (@width - @contraction).times do
        y += 1
        @final_arr[y][x] = @count
        @count += 1
      end

    elsif side == 2
      (@width - @contraction).times do
        x -= 1
        @final_arr[y][x] = @count
        @count += 1
      end
      @contraction += 1

    elsif side == 3
      (@width - @contraction).times do
        y -= 1
        @final_arr[y][x] = @count
        @count += 1
      end
    end

    side += 1
    if side > 3
      side = 0
    end
    build_sides(side, x, y)
  end

end
