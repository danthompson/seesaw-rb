module Seesaw
  class Client
    module Timelines
      # Get recent decisions from the global timeline.
      #
      # @param limit [Fixnum] Number of decisions to return.
      # @return [Array]
      # @example
      #   Seesaw.recent_decisions
      def global_timeline(limit = 10)
        get "timelines/global?limit=#{limit}"
      end
    end
  end
end
