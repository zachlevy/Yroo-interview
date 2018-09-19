### Mars Rovers
`rover.rb` Contains the code related to a single rover.

`mission.rb` Contains the code related to sending a mission.

`simulation.rb` is the main file to run. It takes an argument from the command line which is the path of the mission plan.

#### Getting Started
`$ ruby simulate.rb path/to/your_mission_plan.txt` to create your own mission.

`$ ruby simulate.rb missions/curiosity.txt` is a sample mission

`$ ruby test.rb` to run tests.

#### Zach's mental notes for his approach
* 'L', 'R' and 'M' are movements
* iterate over movements string
* create an array of NSEW, sum, get the remainder of rotations. -- it was easier to just rotate for each character
* store a location {x: 1, y: 1} object -- added direction to this later
* add and subtract based on the new direction (use an if statement)
* return the location
* create classes for rovers and missions, simulation handles the
* didn't bother with a testing library. just `puts expected_result == result` so all tests should output `true`
* assume valid inputs

#### The Problem
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau,
which is curiously rectangular, must be navigated by the rovers so that their on-board
cameras can get a complete view of the surrounding terrain to send back to Earth. A rover's
position and location is represented by a combination of x and y coordinates and a letter
representing one of the four cardinal compass points. The plateau is divided up into a grid to
simplify navigation. An example position might be 0, 0, N, which means the rover is in the
bottom left corner and facing North. In order to control a rover, NASA sends a simple string
of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees
left or right respectively, without moving from its current spot. 'M' means move forward one
grid point, and maintain the same heading.
Assume that the square directly North from (x, y) is (x, y+1).
It must be possible to supply input data to your application via a text file specified on the
command line.

#### INPUT
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates
are assumed to be 0,0.
The rest of the input is information pertaining to the rovers that have been deployed. Each
rover has two lines of input. The first line gives the rover's position, and the second line is a
series of instructions telling the rover how to explore the plateau. The position is made up of
two integers and a letter separated by spaces, corresponding to the x and y coordinates and
the rover's orientation.
Each rover will be finished sequentially, which means that the second rover won't start to
move until the first one has finished moving.

#### OUTPUT
The output for each rover should be its final coordinates and heading.
