require_relative './rover'

class Mission
  attr_reader :map
  attr_reader :rovers

  def initialize file_path
    @mission_plan = file_path
    @rovers = []
    @map = nil
  end

  # only creates the rovers
  # lands them on the surface of the planet
  def land
    # get data from file
    File.open(@mission_plan, "r") do |f|
      f.each_line.with_index do |line, index|
        if index == 0
          map_split = line.gsub("\n", "").split(" ")
          @map = {
            min_x: 0,
            min_y: 0,
            max_x: map_split[0].to_i,
            max_y: map_split[1].to_i
          }
        end

        if index % 2 == 1
          location = line.gsub("\n", "")
          # start location
          # line is the location of the rover
          @rovers << Rover.new(location, self)
        end
      end
    end
  end

  # moves the rovers
  # Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.
  def explore
    # get data from file
    File.open(@mission_plan, "r") do |f|
      f.each_line.with_index do |line, index|
        if index % 2 == 0
          transmission = line.gsub("\n", "")
          # transmit rover movements
          rover = @rovers[(index / 2) - 1]
          rover.receive_transmission(transmission)
        end
      end
    end
  end

  # return human friendly locations in an array
  def locate
    @rovers.map do |rover|
      rover.locate
    end
  end
end
