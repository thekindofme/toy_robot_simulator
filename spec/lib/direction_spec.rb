require './lib/position'
require './lib/direction'

RSpec.describe ToyRobotSimulator::Direction do
  class ToyRobotSimulator::Test < ToyRobotSimulator::Direction; end

  describe '#build' do
    subject { ToyRobotSimulator::Direction }
    it 'returns the relevant Direction type' do
      expect(subject.build 'TEST').to eq ToyRobotSimulator::Test
    end
  end

  describe '#to_s' do
    subject { ToyRobotSimulator::Test }
    it 'returns a properly formatted string representation of the type' do
      expect(subject.to_s).to eq('TEST')
    end
  end
end

RSpec.describe ToyRobotSimulator::North do
  subject { ToyRobotSimulator::North }

  describe '#after_right_turn_direction' do
    it 'returns East' do
      expect(subject.after_right_turn_direction).to eq(ToyRobotSimulator::East)
    end
  end

  describe '#after_left_turn_direction' do
    it 'returns West' do
      expect(subject.after_left_turn_direction).to eq(ToyRobotSimulator::West)
    end
  end

  describe '#after_move_position' do
    it 'increment Y by 1' do
      expect(subject.after_move_position(ToyRobotSimulator::Position.new(0,0)).y).to eq 1
    end
  end
end

RSpec.describe ToyRobotSimulator::South do
  subject { ToyRobotSimulator::South }

  describe '#after_right_turn_direction' do
    it 'returns West' do
      expect(subject.after_right_turn_direction).to eq(ToyRobotSimulator::West)
    end
  end

  describe '#after_left_turn_direction' do
    it 'returns East' do
      expect(subject.after_left_turn_direction).to eq(ToyRobotSimulator::East)
    end
  end

  describe '#after_move_position' do
    it 'decrement Y by 1' do
      expect(subject.after_move_position(ToyRobotSimulator::Position.new(0,1)).y).to eq 0
    end
  end
end

RSpec.describe ToyRobotSimulator::East do
  subject { ToyRobotSimulator::East }

  describe '#after_right_turn_direction' do
    it 'returns South' do
      expect(subject.after_right_turn_direction).to eq(ToyRobotSimulator::South)
    end
  end

  describe '#after_left_turn_direction' do
    it 'returns North' do
      expect(subject.after_left_turn_direction).to eq(ToyRobotSimulator::North)
    end
  end

  describe '#after_move_position' do
    it 'increment X by 1' do
      expect(subject.after_move_position(ToyRobotSimulator::Position.new(0,0)).x).to eq 1
    end
  end
end

RSpec.describe ToyRobotSimulator::West do
  subject { ToyRobotSimulator::West }

  describe '#after_right_turn_direction' do
    it 'returns North' do
      expect(subject.after_right_turn_direction).to eq(ToyRobotSimulator::North)
    end
  end

  describe '#after_left_turn_direction' do
    it 'returns South' do
      expect(subject.after_left_turn_direction).to eq(ToyRobotSimulator::South)
    end
  end

  describe '#after_move_position' do
    it 'decrement X by 1' do
      expect(subject.after_move_position(ToyRobotSimulator::Position.new(1,1)).x).to eq 0
    end
  end
end