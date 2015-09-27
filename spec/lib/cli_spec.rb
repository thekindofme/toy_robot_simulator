require './lib/table_top'
require './lib/position'
require './lib/robot'
require './lib/user_command'
require './lib/cli'

RSpec.describe ToyRobotSimulator::Cli do
  class TestSystem
    def gets
      'sample_user_input'
    end

    def puts *args; end
    def exit status; end
  end

  class TestUserCommand
    def initialize(robot, user_input);end
    def execute;'test output';end
  end

  let(:test_user_command_type) { TestUserCommand }
  let(:test_system) { TestSystem.new }
  let(:robot) { ToyRobotSimulator::Robot.new(ToyRobotSimulator::TableTop.new(5, 5)) }
  subject { ToyRobotSimulator::Cli.new(test_system, robot, test_user_command_type) }

  describe '#receive_and_process_user_input' do
    it 'read user input' do
      expect(test_system).to receive(:gets).and_return('')
      subject.receive_and_process_user_input
    end

    it 'creates and execute a user command' do
      test_user_command_instance_double = double
      expect(TestUserCommand).to receive(:new)
                                     .with(robot, 'sample_user_input')
                                     .and_return(test_user_command_instance_double)
      expect(test_user_command_instance_double).to receive(:execute)
      subject.receive_and_process_user_input
    end

    it 'prints out the output' do
      expect(test_system).to receive(:puts).with('test output')
      subject.receive_and_process_user_input
    end
  end
end