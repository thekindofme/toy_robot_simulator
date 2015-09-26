require './lib/robot'
require './lib/table_top'

RSpec.describe ToyRobotSimulator::Robot do
  subject { ToyRobotSimulator::Robot.new ToyRobotSimulator::TableTop.new(5,5) }

  describe '#place' do
    context 'valid' do
      before { subject.place 0,0,:north }

      it 'sets X' do
        expect(subject.position_x).to eq 0
      end

      it 'sets Y' do
        expect(subject.position_y).to eq 0
      end

      it 'sets facing direction' do
        expect(subject.direction).to eq :north
      end
    end

    context 'invalid' do
      before { subject.place 3,6,:south }

      it 'does not set X'  do
        expect(subject.position_x).to be nil 
      end

      it 'does not set Y' do
        expect(subject.position_y).to be nil
      end

      it 'does not set facing direction' do
        expect(subject.direction).to be nil
      end
    end
  end

  describe '#move' do
    context 'after initial PLACE command' do
      context 'valid' do
        it 'moves one unit forward in the set direction'
      end

      context 'invalid' do
        it 'does not move'
      end
    end

    context 'before initial PLACE command' do
      it 'does not move'
    end
  end

  describe '#left' do
    context 'after initial PLACE command' do
      context 'valid' do
        it 'rotates 90 degrees to the left'
        it 'does not move'
      end

      context 'invalid' do
        it 'does not rotate'
        it 'does not move'
      end
    end

    context 'before initial PLACE command' do
      it 'does not rotate'
      it 'does not move'
    end
  end

  describe '#right' do
    context 'after initial PLACE command' do
      context 'valid' do
        it 'rotates 90 degrees to the right'
        it 'does not move'
      end

      context 'invalid' do
        it 'does not rotate'
        it 'does not move'
      end
    end

    context 'before initial PLACE command' do
      it 'does not rotate'
      it 'does not move'
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