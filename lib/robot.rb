module ToyRobotSimulator
  class Robot
    attr_accessor :position_x, :position_y, :direction

    def initialize table_top
      self.table_top = table_top
    end

    def place position_x,position_y,direction
      return false unless table_top.valid_position? position_x, position_y

      self.position_x = position_x
      self.position_y = position_y
      self.direction = direction
    end

    private
    attr_accessor :table_top
  end
end