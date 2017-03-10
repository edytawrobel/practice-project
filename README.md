
[![Coverage Status](https://coveralls.io/repos/github/edytawrobel/practice-project/badge.svg?branch=master)](https://coveralls.io/github/edytawrobel/practice-project?branch=master)

[![Build Status](https://travis-ci.org/edytawrobel/practice-project.svg?branch=master)](https://travis-ci.org/edytawrobel/practice-project)

Problem: Mars Rover
===================

Instructions:
=============

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

* Written in **Ruby 2.2.3**
* Tested using **RSpec**

## Installation

- unzip 'rovers.zip' folder
- in the terminal:

```
cd rovers
gem install bundler
bundle install
```

## See tests' results

```
rspec
```

### How to Run the App

```
ruby run.rb
```

### Steps in my development process

#### Created user stories

  ```
  As a NASA Operator
  So that I can proceed with the mission
  I would like to land rovers on the plateau of Mars

  As a NASA Operator
  So that I can control a rover
  I would like to be able to process the instructions given

  As a NASA Operator
  So that I can change the direction a rover's heading towards
  I would like to be able to instruct a rover to spin 90 degrees left or right

  As a NASA Operator
  So that I can change the location of a rover
  I would like to be able to instruct a rover to move one step forward

  As a NASA Operator
  So that I can control a rover
  I'd like it to be able to check its current position

  As a NASA Operator
  So that I can ensure the rovers do not fall off a plateau
  I would like to restrict their movement when they reach its edge boundaries
  ```

#### Developed Domain Model:

| Messages | Objects |
|:---------|:--------------|
| control, process instructions | Operator |
| turn, move, report position |  Vehicle |
| width, height | Surface |

#### Responsibilities of each model:

1. Vehicle - responsible for moving in various directions on a certain surface
2. Operator - responsible for processing the input given, controlling the vehicles
3. Surface - provides a surface to land on, limited by its width and hight


#### Building each feature one by one

  * Write unit test
  * Test      - RED
  * Code
  * Test    - GREEN
  * Refactor
  * Test the whole application with feature tests

### Approach to the problem

I aimed to design an easy to understand, flexible, modular and reusable CLI following the principles of OOD and TDD:

1. Classes are no longer than one hundred lines of code
2. Methods are no longer than five lines of code
3. No more than four parameters are passed into a method
4. Hash options are parameters
5. SOLID
6. DRY
7. Follows the Law of Demeter (LoD)
8. Tested (unit level, feature level)

Program can deploy vehicles on a certain surface and return their final location.
Operator is responsible for processing the given string input. It then instructs the vehicle to move forward or turn. It can report back the current location of the vehicle.

Vehicle is a standalone class, it does not depend on its operator, it could be used in a completely different context. Hence, the name. It moves through a grid aligned to the cardinal compass points, but if needed these two could be decoupled easily.

#### Ideas for extension

Below is a list of ideas that could be implemented in future:

* At the moment, surface is merely a data object (code smell!) as it does not have any behaviour. However, who knows if in future our client won't get back to us asking to add some functionality, like recording on a map the current position of a vehicle. I decided to keep it as is with this future in mind.
