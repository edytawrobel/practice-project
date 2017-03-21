
[![Coverage Status](https://coveralls.io/repos/github/edytawrobel/practice-project/badge.svg?branch=master)](https://coveralls.io/github/edytawrobel/practice-project?branch=master)

[![Build Status](https://travis-ci.org/edytawrobel/practice-project.svg?branch=master)](https://travis-ci.org/edytawrobel/practice-project)

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

