module ToyRobotSimulator
  class Cli
    INTRO = 'ToyRobotSimulator...er'

    def initialize system, robot, user_command_type
      self.system, self.robot, self.user_command_type = system, robot, user_command_type
    end

    def run
      system.puts INTRO
      while true
        receive_and_process_user_input
      end
    end

    def receive_and_process_user_input
      system.puts(
          user_command_type.new(robot, user_input).execute
      )
    end

    private
    attr_accessor :system, :robot, :user_command_type

    def user_input
      system.gets.chomp
    end
  end
end