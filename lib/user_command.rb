require 'position'

module ToyRobotSimulator
  class UserCommand
    attr_accessor :command_string

    def initialize robot, command_string
      self.robot, self.command_string = robot, command_string
    end

    def execute
      robot.send verb, position, direction
    end

    private
    attr_accessor :robot
    def verb
      command_string.split(/ /).first.downcase.to_sym
    end

    def position
      ToyRobotSimulator::Position.new data[0].to_i, data[1].to_i
    end

    def direction
      data[2].downcase.to_sym
    end

    def data
      command_string.split(/ /)[1].split(/,/)
    end
  end

end