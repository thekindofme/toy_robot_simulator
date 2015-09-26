require 'position'

module ToyRobotSimulator
  class TableTop
    attr_accessor :width, :height

    def initialize width, height
      self.width, self.height = width, height
    end

    def valid_position? position
      valid_position_x?(position) && valid_position_y?(position)
    end

    private
    def valid_position_x? position
      position.x.between? 0,width-1
    end

    def valid_position_y? position
      position.y.between? 0, height-1
    end
  end
end