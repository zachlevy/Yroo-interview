require_relative './mission'

filepath1 = "curiosity.txt"
mission1 = Mission.new(filepath1)
mission1.land
mission1.explore
puts "1 3 N" == mission1.locate[0]
puts "5 1 E" == mission1.locate[1]
