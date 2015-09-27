require './lib/table_top'
require './lib/robot'
require './lib/cli'
require './lib/position'
require './lib/user_command'
require './lib/system'

ToyRobotSimulator::Cli.new(
    ToyRobotSimulator::System,
    ToyRobotSimulator::Robot.new(ToyRobotSimulator::TableTop.new(5,5)),
    ToyRobotSimulator::UserCommand
).run