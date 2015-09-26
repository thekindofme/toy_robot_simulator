require './lib/table_top'

RSpec.describe ToyRobotSimulator::TableTop do
  subject { ToyRobotSimulator::TableTop.new(5, 5) }

  describe 'valid_position?' do
    context 'position out of table' do
      it 'returns false' do
        expect(subject.valid_position? 4, 6).to be false
      end
    end

    context 'position inside table' do
      it 'returns true' do
        expect(subject.valid_position? 0, 4).to be true
      end
    end
  end
end