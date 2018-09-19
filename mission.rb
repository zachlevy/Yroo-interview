require_relative './rover'

# specify a file
class Mission
  def initialize file_path
    @mission_plan = file_path
    @rovers = []
  end

  # only creates the rovers
  # lands them on the surface of the planet
  def land
    # get data from file
    File.open(@mission_plan, "r") do |f|
      f.each_line.with_index do |line, index|
        @map = line if index == 0

        if index % 2 == 1
          location = line.gsub("\n", "")
          # start location
          # line is the location of the rover
          puts location.inspect
          @rovers << Rover.new(location)
        end
      end
    end
  end

end
