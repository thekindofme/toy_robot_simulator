module ToyRobotSimulator
  class System
    class << self
      def gets
        Kernel.gets
      end

      def puts *args
        Kernel.puts args
      end

      def exit status
        Kernel.exit status
      end
    end
  end
end