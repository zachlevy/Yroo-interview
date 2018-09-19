# add out of bounds error for falling off plateau
class Rover
  attr_reader :location

  class RoverOffPlateau < StandardError
    def message
      "Rover is located outside of the plateau!"
    end
  end

  class RoverColission < StandardError
    def message
      "Two rovers collided!"
    end
  end

  CARDINAL_DIRECTIONS = ["N", "E", "S", "W"]

  # location formatted as: "1 2 N"
  def initialize location, mission
    location_split = location.split(" ")
    @location = {
      x: location_split[0].to_i,
      y: location.split(" ")[1].to_i,
      direction: location.split[2]
    }
    @mission = mission
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
    check_collisions
  end

  # check if the rover is off the plateau
  def check_bounds
    map = @mission.map
    raise RoverOffPlateau if @location[:y] < map[:min_y] || @location[:x] < map[:min_x] || @location[:y] > map[:max_y] || @location[:x] > map[:max_x]
  end

  # check if two rovers on the mission collide
  def check_collisions
    @mission.rovers.each do |rover|
      if rover != self
        raise RoverColission if rover.location[:x] == self.location[:x] && rover.location[:y] == self.location[:y]
      end
    end
  end

end
