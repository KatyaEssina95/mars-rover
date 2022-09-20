# mars-rover
Ruby command-line tool to simulate Mars Rover robots

## Running the project

1. [Install ruby](https://www.ruby-lang.org/en/documentation/installation/) (at least v3.1)
2. Close this repo locally
3. Install the bundler gem by running `gem install bundler`
4. Run `bundle install` (this will install the gems required for this project)
5. From the root directory, run `ruby mars_rover.rb -f <INPUT TEXT FILE>` where `<INPUT TEXT FILE>` is the path to a `.txt` file representing the mars rover input.

## Input file structure
The input file should have the following format:
```
4 8
(2, 3, E) LFRFF
(0, 2, N) FFLFRFF
```
- where the first line describes the `world` dimensions (x, y)
- the second and third rows represent robots. (2, 3, E) is the starting position of the second robot (x, y, orientation) and LFRFF is the movement sequence the robot should perform.

If the above file is called `example.txt`, running `ruby mars_rover.rb -f example.txt` should print the following output to the terminal:
``` 
(4, 4, E)
(0, 4, W) LOST
```

## Improvements
- Add test cases for testing full application
- This project could be extended to use an interactive command line to capture user input. This I think would make the user experience nicer. I would use the [highline gem](https://github.com/JEG2/highline) to interact with the user.
- It would be nice to package & publish this as a ruby gem to make integration with other Ruby projects easier.
