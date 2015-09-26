require './lib/robot'

RSpec.describe ToyRobotSimulator::Robot do
  describe '#place' do
    context 'valid' do
      it 'sets X'
      it 'sets Y'
      it 'sets facing direction'
    end

    context 'invalid' do
      it 'does not set X'
      it 'does not set Y'
      it 'does not set facing direction'
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