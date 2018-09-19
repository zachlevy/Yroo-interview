require_relative './mission'

# requires a path to a mission file as a first argument in command line
filepath = ARGV.first

mission = Mission.new(filepath)
mission.land
mission.explore
mission.locate.each do |location|
  puts location
end
