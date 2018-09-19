class Rover
  CARDINAL_DIRECTIONS = ["N", "E", "S", "W"]

  # location formatted as: "1 2 N"
  def initialize location
    location_split = location.split(" ")
    @location = {
      x: location_split[0].to_i,
      y: location.split(" ")[1].to_i,
      direction: location.split[2]
    }
  end

  def locate
    "#{@location[:x]} #{@location[:y]} #{@location[:direction]}"
  end

  def rotate direction
    direction_index = CARDINAL_DIRECTIONS.find_index(@location[:direction])

    if direction == "R"
      direction_index += 1
    else
      direction_index -= 1
    end

    direction_index %= 4

    @location[:direction] = CARDINAL_DIRECTIONS[direction_index]
  end

  def receive_transmission instructions
    instructions.chars.each do |char|
      if char == "M"
        move()
      else
        rotate(char)
      end
    end
  end

  def move
    case @location[:direction]
    when "N"
      @location[:y] += 1
    when "S"
      @location[:y] -= 1
    when "E"
      @location[:x] += 1
    when "W"
      @location[:x] -= 1
    end
  end

end
