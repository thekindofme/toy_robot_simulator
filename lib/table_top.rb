require 'position'

module ToyRobotSimulator
  class TableTop
    attr_accessor :width, :height

    def initialize width, height
      self.width = width
      self.height = height
    end

    def valid_position? position
      valid_position_x?(position) && valid_position_y?(position)
    end

    private
    def valid_position_x? position
      position.x.between? 0,width
    end

    def valid_position_y? position
      position.y.between? 0, height
    end
  end
end