require 'position'

module ToyRobotSimulator
  class Robot
    attr_accessor :position, :direction

    def initialize table_top
      self.table_top = table_top
    end

    def place position,direction
      return false unless table_top.valid_position? position

      self.position = position
      self.direction = direction
    end

    private
    attr_accessor :table_top
  end
end