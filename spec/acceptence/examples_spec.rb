require './lib/table_top'
require './lib/robot'
require './lib/cli'
require './lib/position'
require './lib/user_command'
require './lib/system'

def execute_user_command command
  ToyRobotSimulator::UserCommand.new(robot, command).execute
end

def execute_user_commands commands
  commands.inject(nil) { |_, command| execute_user_command command }
end

describe 'Exercise examples' do
  let(:robot) { ToyRobotSimulator::Robot.new(ToyRobotSimulator::TableTop.new(5,5)) }

  context 'Exercise a' do
    # PLACE 0,0,NORTH
    # MOVE
    # REPORT
    # Output: 0,1,NORTH
    #
    it 'return output 0,1,NORTH' do
      expect(execute_user_commands ['PLACE 0,0,NORTH', 'MOVE', 'REPORT']).to eq('0,1,NORTH')
    end
  end

  context 'Exercise b' do
    # PLACE 0,0,NORTH
    # LEFT
    # REPORT
    # Output: 0,0,WEST
    #
    it 'return output 0,0,WEST' do
      expect(execute_user_commands ['PLACE 0,0,NORTH', 'LEFT', 'REPORT']).to eq('0,0,WEST')
    end
  end

  context 'Exercise c' do
    # PLACE 1,2,EAST
    # MOVE
    # MOVE
    # LEFT
    # MOVE
    # REPORT
    # Output: 3,3,NORTH
    it 'return output 3,3,NORTH' do
      expect(execute_user_commands ['PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE', 'REPORT']).to eq('3,3,NORTH')
    end
  end
end