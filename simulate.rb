require_relative './mission'

filepath = ARGV.first

mission = Mission.new(filepath)
mission.land
mission.explore
mission.locate.each do |location|
  puts location
end
