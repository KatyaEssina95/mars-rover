require_relative "lib/mars_rover"
require "optparse"

class CLI
  attr_reader :file

  def initialize(options)
    abort "Please specify an input .txt file by setting the -f flag" if options[:file].nil?
    @file = options[:file]
  end

  def call
    begin
      input_lines = FileReader.new(file).lines
      world_input = InputParsers::World.new(input_lines.shift)
      robot_inputs = input_lines.map { |line| InputParsers::Robot.new(line) }
      MarsRover.new(world_input:, robot_inputs:).simulate
    rescue => e
      abort e.message
    end
  end
end

if $0 == __FILE__
  options = {}

  OptionParser.new do |parser|
    parser.on("-f", "--file FILE", "A mars rover text file") do |v|
      options[:file] = v
    end
  end.parse!

  CLI.new(options).call
end
