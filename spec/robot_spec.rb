require './lib/robot'
require './lib/table_top'
require './lib/position'

RSpec.describe ToyRobotSimulator::Robot do
  subject { ToyRobotSimulator::Robot.new ToyRobotSimulator::TableTop.new(5,5) }

  describe '#place' do
    context 'valid' do
      before { subject.place(ToyRobotSimulator::Position.new(0,0),:north) }

      it 'sets X' do
        expect(subject.position.x).to eq 0
      end

      it 'sets Y' do
        expect(subject.position.y).to eq 0
      end

      it 'sets facing direction' do
        expect(subject.direction).to eq :north
      end
    end

    context 'invalid' do
      before { subject.place(ToyRobotSimulator::Position.new(3,6),:south) }

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
        before { subject.place ToyRobotSimulator::Position.new(2,3),:north }

        it 'moves one unit forward in the set direction' do
          subject.move
          expect(subject.position.x).to eq(2)
          expect(subject.position.y).to eq(4)
        end
      end

      context 'invalid' do
        before { subject.place ToyRobotSimulator::Position.new(2,4),:north }

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

  describe '#turn_left' do
    context 'after initial PLACE command' do
      before { subject.place ToyRobotSimulator::Position.new(2,3),:east }

      it 'rotates 90 degrees to the left' do
        subject.turn_left
        expect(subject.direction).to eq(:north)
      end

      it 'does not move' do
        subject.turn_left
        expect(subject.position).to eq(ToyRobotSimulator::Position.new(2,3))
      end
    end

    context 'before initial PLACE command' do
      it 'does not rotate' do
        subject.turn_left
        expect(subject.direction).to eq(nil)
      end

      it 'does not move' do
        subject.turn_left
        expect(subject.position).to eq(nil)
      end
    end
  end

  describe '#turn_right' do
    context 'after initial PLACE command' do
      before { subject.place ToyRobotSimulator::Position.new(2,3),:south }

      it 'rotates 90 degrees to the right' do
        subject.turn_right
        expect(subject.direction).to eq(:west)
      end

      it 'does not move' do
        subject.turn_right
        expect(subject.position).to eq(ToyRobotSimulator::Position.new(2,3))
      end
    end

    context 'before initial PLACE command' do
      it 'does not rotate' do
        subject.turn_right
        expect(subject.direction).to eq(nil)
      end

      it 'does not move' do
        subject.turn_right
        expect(subject.position).to eq(nil)
      end
    end
  end

  describe '#report'  do
    context 'after initial PLACE command' do
      it 'announces X'
      it 'announces Y'
      it 'announces facing direction'
    end

    context 'before initial PLACE command' do
      it 'announces uninitialized state'
    end
  end
end