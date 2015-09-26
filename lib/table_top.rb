module ToyRobotSimulator
  class TableTop
    attr_accessor :width, :height

    def initialize width, height
      self.width = width
      self.height = height
    end

    def valid_position? position_x, position_y
      valid_position_x?(position_x) && valid_position_y?(position_y)
    end

    private
    def valid_position_x? position_x
      position_x.between? 0,width
    end

    def valid_position_y? position_y
      position_y.between? 0, height
    end
  end
end