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
      self.direction = direction.after_left_turn_direction
    end

    def right
      return false unless initial_placement_done?
      self.direction = direction.after_right_turn_direction
    end

    def report
      return 'not placed on the board yet' unless initial_placement_done?
      "#{position.x},#{position.y},#{direction}"
    end

    private
    attr_accessor :table_top

    def initial_placement_done?
      !!position
    end

    def after_move_position
      direction.after_move_position(position)
    end
  end
end