require './lib/robot'
require './lib/table_top'
require './lib/position'
require './lib/direction'

RSpec.describe ToyRobotSimulator::Robot do
  subject { ToyRobotSimulator::Robot.new ToyRobotSimulator::TableTop.new(5,5) }

  describe '#place' do
    context 'valid' do
      before { subject.place(ToyRobotSimulator::Position.new(0,0), ToyRobotSimulator::North) }

      it 'sets X' do
        expect(subject.position.x).to eq 0
      end

      it 'sets Y' do
        expect(subject.position.y).to eq 0
      end

      it 'sets facing direction' do
        expect(subject.direction).to eq ToyRobotSimulator::North
      end
    end

    context 'invalid' do
      before { subject.place(ToyRobotSimulator::Position.new(3,6), ToyRobotSimulator::South) }

      it 'does not set position'  do
        expect(subject.position).to be nil
      end

      it 'does not set facing direction' do
        expect(subject.direction).to be nil
      end
    end
  end

  describe '#move' do
    context 'after initial PLACE command' do

      context 'valid' do
        before { subject.place ToyRobotSimulator::Position.new(2,3), ToyRobotSimulator::North }

        it 'moves one unit forward in the set direction' do
          subject.move
          expect(subject.position.x).to eq(2)
          expect(subject.position.y).to eq(4)
        end
      end

      context 'invalid' do
        before { subject.place ToyRobotSimulator::Position.new(2,4), ToyRobotSimulator::North }

        it 'does not move' do
          subject.move
          expect(subject.position.x).to eq(2)
          expect(subject.position.y).to eq(4)
        end
      end
    end

    context 'before initial PLACE command' do
      it 'does not move' do
        subject.move
        expect(subject.position).to be nil
      end
    end
  end

  describe '#left' do
    context 'after initial PLACE command' do
      before { subject.place ToyRobotSimulator::Position.new(2,3), ToyRobotSimulator::East }

      it 'rotates 90 degrees to the left' do
        subject.left
        expect(subject.direction).to eq(ToyRobotSimulator::North)
      end

      it 'does not move' do
        subject.left
        expect(subject.position).to eq(ToyRobotSimulator::Position.new(2,3))
      end
    end

    context 'before initial PLACE command' do
      it 'does not rotate' do
        subject.left
        expect(subject.direction).to eq(nil)
      end

      it 'does not move' do
        subject.left
        expect(subject.position).to eq(nil)
      end
    end
  end

  describe '#right' do
    context 'after initial PLACE command' do
      before { subject.place ToyRobotSimulator::Position.new(2,3), ToyRobotSimulator::South }

      it 'rotates 90 degrees to the right' do
        subject.right
        expect(subject.direction).to eq(ToyRobotSimulator::West)
      end

      it 'does not move' do
        subject.right
        expect(subject.position).to eq(ToyRobotSimulator::Position.new(2,3))
      end
    end

    context 'before initial PLACE command' do
      it 'does not rotate' do
        subject.right
        expect(subject.direction).to eq(nil)
      end

      it 'does not move' do
        subject.right
        expect(subject.position).to eq(nil)
      end
    end
  end

  describe '#report'  do
    context 'after initial PLACE command' do
      before { subject.place ToyRobotSimulator::Position.new(4,3), ToyRobotSimulator::West }

      it 'return current position and direction in the proper format' do
        expect(subject.report).to eq('4,3,WEST')
      end
    end

    context 'before initial PLACE command' do
      it 'announces uninitialized state' do
        expect(subject.report).to eq(ToyRobotSimulator::Robot::UNINITIALIZED_MSG)
      end
    end
  end
end