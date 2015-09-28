module ToyRobotSimulator
  class UserCommand
    attr_accessor :command_string

    def initialize robot, command_string
      self.robot, self.command_string = robot, command_string
    end

    def execute
      robot.send(verb, *(data ? [position, direction] : nil))
    end

    private
    attr_accessor :robot
    def verb
      split_verb_and_data.first.downcase.to_sym
    end

    def position
      Position.new data[0].to_i, data[1].to_i
    end

    def direction
      Direction.build(data[2])
    end

    def data
      return nil if split_verb_and_data.size < 2
      split_verb_and_data[1].split(/,/)
    end

    def split_verb_and_data
      command_string.split(/ /)
    end
  end

end