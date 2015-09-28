module ToyRobotSimulator
  class Direction
    class << self
      def build type
        Object.const_get("ToyRobotSimulator::#{type.capitalize}")
      end

      def to_s
        super.gsub(/^.*::/, '').upcase
      end
    end
  end

  class North < Direction
    class << self
      def after_right_turn_direction
        East
      end

      def after_left_turn_direction
        West
      end

      def after_move_position position
        Position.new(position.x, position.y + 1)
      end
    end
  end

  class South < Direction
    class << self
      def after_right_turn_direction
        West
      end

      def after_left_turn_direction
        East
      end

      def after_move_position position
        Position.new(position.x, position.y - 1)
      end
    end
  end

  class East < Direction
    class << self
      def after_right_turn_direction
        South
      end

      def after_left_turn_direction
        North
      end

      def after_move_position position
        Position.new(position.x + 1, position.y)
      end
    end
  end

  class West < Direction
    class << self
      def after_right_turn_direction
        North
      end

      def after_left_turn_direction
        South
      end

      def after_move_position position
        Position.new(position.x - 1, position.y)
      end
    end
  end
end