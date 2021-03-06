require './lib/position'
require './lib/direction'
require './lib/user_command'

RSpec.describe ToyRobotSimulator::UserCommand do
  let(:robot) { double }

  describe '#execute' do
    context 'command => PLACE' do
      subject { ToyRobotSimulator::UserCommand.new(robot, 'PLACE 0,0,NORTH') }

      it 'calls place on robot' do
        expect(robot).to receive(:place) do |position, direction|
          expect(position.x).to eq(0)
          expect(position.y).to eq(0)
          expect(direction).to eq(ToyRobotSimulator::North)
        end

        subject.execute
      end
    end

    context 'command => MOVE' do
      subject { ToyRobotSimulator::UserCommand.new(robot, 'MOVE') }

      it 'calls move on robot' do
        expect(robot).to receive(:move)
        subject.execute
      end
    end

    context 'command => LEFT' do
      subject { ToyRobotSimulator::UserCommand.new(robot, 'LEFT') }

      it 'calls left on robot' do
        expect(robot).to receive(:left)
        subject.execute
      end
    end

    context 'command => RIGHT' do
      subject { ToyRobotSimulator::UserCommand.new(robot, 'RIGHT') }

      it 'calls left on robot' do
        expect(robot).to receive(:right)
        subject.execute
      end
    end

    context 'command => REPORT' do
      subject { ToyRobotSimulator::UserCommand.new(robot, 'REPORT') }

      it 'calls left on robot' do
        expect(robot).to receive(:report)
        subject.execute
      end
    end
  end
end