require_relative './mission'
require_relative './rover'

# mission 1
filepath1 = "curiosity.txt"
mission1 = Mission.new(filepath1)

mission1.land

puts "1 2 N" == mission1.locate[0]
puts "3 3 E" == mission1.locate[1]

mission1.explore

# ensure correct amount of rovers
puts 2 == mission1.locate.length
# rover 1 final destination
puts "1 3 N" == mission1.locate[0]
# rover 2 final destination
puts "5 1 E" == mission1.locate[1]

# ensure the map gets loaded
puts "5 5" == mission1.map



# mission 2
# have rover move off of plateau

filepath2 = "icarus.txt"
mission2 = Mission.new(filepath2)

mission2.land

puts "5 5 N" == mission2.locate[0]

begin
  mission2.explore
  puts false
rescue => e
  puts Rover::RoverOffPlateau == e.class
end




# mission 3
# weird commands

filepath3 = "moon_mist.txt"
mission3 = Mission.new(filepath3)

mission3.land

mission3.explore

# rover 1 final destination
puts "5 4 S" == mission3.locate[0]
puts "3 2 S" == mission3.locate[1]
