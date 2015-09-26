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
          expect(direction).to eq(:north)
        end

        subject.execute
      end
    end
  end
end