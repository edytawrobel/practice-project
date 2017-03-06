Problem : Mars Rover

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

Input:

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.
The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.
Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.
     Output: The output for each rover should be its final co-ordinates and heading.



     Input and Output

Test Input:

5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM

Expected Output:

1 3 N

5 1 E

### Dependencies

* Written in **Ruby 2.3.3**
* Tested using **RSpec**

## Installation

- unzip 'mars_rover.zip'
- in the terminal:

```
cd mars_rover
gem install bundler
bundle install
```

For testing run the following command:

``` rspec ```


### How to Run the App


```

```


### Steps in my development process

#### Created user stories

  ```
  As a NASA Operator
  So that I can proceed with the mission
  I would like to land rovers on plateau

  As a NASA Operator
  So that I can control a rover
  I would like to be able to process the instructions given

  As a NASA Operator
  So that I can change the direction a rover's heading
  I would like to be able to instruct a rover to spin 90 degrees left or right

  As a NASA Operator
  So that I can change the location a rover
  I would like to be able to instruct a rover to move one grid forward

  As a Rover
  So that I can send the view of terrain back to Earth
  I would like to be able to navigate the plateau's grid

  As a Rover
  So that I can move effectively
  I would like to be able to execute commands given

  As a Rover,
  So that others can verify where I am on the plateau,
  I'd like it to be able to report my current position and location.

  ```


  ```

  * Ensure Operator has some rover and some surface to land it on
  * Ensure Operator can process the input given to instruct a rover accordingly

  * Ensure Rover has some x,y coordinates and direction it is heading towards
  * Ensure Rover knows of max_x and max_y coordinates of plateau's grid, so it does not fall off
  * Ensure Rover can report its position and heading back

  * Ensure Plateau has a grid with max_x and max_y coordinates
  * Ensure Plateau validates the coordinates given

    ```

  #### Developed the domain model, as follows:

  | Messages | Objects |
  |:---------|:--------------|
  | land_rovers (on plateau)| NASA Operator|
  | process_instructions ("LRM")| NASA Operator|
  | has_position (x,y), has_location(compass_point) | Rover |
  | execute_commands: turn_left, turn_right, move_forward | Rover |
  | report_location | Rover |
  | has_grid, check_coordinates | Plateau |

* **Building each feature one by one**
  * Wrote unit test
  * Tested - RED
  * Code
  * Tested - GREEN
  * Refactored

### Ideas for extension

Below is a list of ideas that would have been nice to implement with more time:
* **XX**
* **XX**
