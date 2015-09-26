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

    def move
      return false unless initial_placement_done?
      return false unless table_top.valid_position? after_move_position
      self.position = after_move_position
    end

    def turn_left
      return false unless initial_placement_done?
      self.direction = after_turn_direction
    end

    private
    attr_accessor :table_top

    def initial_placement_done?
      !!position
    end

    def after_turn_direction
      case direction
        when :north
          :west
        when :south
          :east
        when :east
          :north
        when :west
          :south
      end
    end

    def after_move_position
      case direction
      when :north
        Position.new(position.x, position.y + 1)
      when :south
        Position.new(position.x, position.y - 1)
      when :east
        Position.new(position.x + 1, position.y)
      when :west
        Position.new(position.x - 1, position.y)
      end
    end
  end
end