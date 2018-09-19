# add out of bounds error for falling off plateau
class Rover
  class RoverOffPlateau < StandardError
    def message
      "Rover is located outside of the plateau!"
    end
  end

  CARDINAL_DIRECTIONS = ["N", "E", "S", "W"]

  # location formatted as: "1 2 N"
  def initialize map, location
    location_split = location.split(" ")
    @location = {
      x: location_split[0].to_i,
      y: location.split(" ")[1].to_i,
      direction: location.split[2]
    }
    map_split = map.split(" ")
    @map = {
      min_x: 0,
      min_y: 0,
      max_x: map_split[0].to_i,
      max_y: map_split[1].to_i
    }
  end

  def locate
    "#{@location[:x]} #{@location[:y]} #{@location[:direction]}"
  end

  def rotate direction
    direction_index = CARDINAL_DIRECTIONS.find_index(@location[:direction])

    if direction == "R"
      direction_index += 1
    elsif direction == "L"
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
    check_bounds
  end

  # check if the rover is off the plateau
  def check_bounds
    raise RoverOffPlateau if @location[:y] < @map[:min_y] || @location[:x] < @map[:min_x] || @location[:y] > @map[:max_y] || @location[:x] > @map[:max_x]
  end

end
