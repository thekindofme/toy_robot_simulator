module ToyRobotSimulator
  class Robot
    UNINITIALIZED_MSG = 'not placed on the board yet'
    attr_accessor :position, :direction

    def initialize table_top
      self.table_top = table_top
    end

    def place position,direction
      return false unless table_top.valid_position? position

      self.position, self.direction = position, direction
    end

    def move
      return false unless initial_placement_done?
      return false unless table_top.valid_position? after_move_position
      self.position = after_move_position
    end

    def left
      return false unless initial_placement_done?
      self.direction = after_left_turn_direction
    end

    def right
      return false unless initial_placement_done?
      self.direction = after_right_turn_direction
    end

    def report
      return 'not placed on the board yet' unless initial_placement_done?
      "#{position.x},#{position.y},#{direction.upcase}"
    end

    private
    attr_accessor :table_top

    def initial_placement_done?
      !!position
    end

    def after_right_turn_direction
      case direction
        when :north
          :east
        when :south
          :west
        when :east
          :south
        when :west
          :north
      end
    end

    def after_left_turn_direction
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