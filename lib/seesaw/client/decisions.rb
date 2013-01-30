module Seesaw
  class Client
    module Decisions
      # Get a single decision
      #
      # @param user_id [Numeric] The decision's user id
      # @param decision_id [Numeric] The decision's id
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.decision(1, 1)
      def decision(user_id, decision_id)
        get "users/#{user_id}/decisions/#{decision_id}"
      end

      # Create a decision
      #
      # @param user_id [Numeric] A Seesaw user id
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.create_decision(1)
      def create_decision(user_id)
        post "users/#{user_id}/decisions"
      end

      # Publish a decision
      #
      # @param user_id [Numeric] The decision's user id
      # @param decision_id [Numeric] The decision's id
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.publish_decision(1, 1)
      def publish_decision(user_id, decision_id)
        post "users/#{user_id}/decisions/#{decision_id}/publish"
      end

      # Destroy a decision
      #
      # @param user_id [Numeric] The decision's user id
      # @param decision_id [Numeric] The decision's id
      # @return [Boolean] True if follow was successful, false otherwise.
      # @example
      #   Seesaw.destroy(1, 1)
      def destroy_decision(user_id, decision_id)
        boolean_from_response :delete, "users/#{user_id}/decisions/#{decision_id}"
      end

      # Get decision analytics
      #
      # @param user_id [Numeric] The decision's user id
      # @param decision_id [Numeric] The decision's id
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.decision_analytics(1, 1)
      def decision_analytics(user_id, decision_id)
        get "users/#{user_id}/decisions/#{decision_id}/analytics"
      end

      # Flag a decision for content review
      #
      # @param user_id [Numeric] The decision's user id
      # @param decision_id [Numeric] The decision's id
      # @return [Boolean] True if follow was successful, false otherwise.
      # @example
      #   Seesaw.flag_decision(1, 1)
      def flag_decision(user_id, decision_id)
        boolean_from_response :post, "users/#{user_id}/decisions/#{decision_id}/flag"
      end

      # Unflag a decision for content review
      #
      # @param user_id [Numeric] The decision's user id
      # @param decision_id [Numeric] The decision's id
      # @return [Boolean] True if follow was successful, false otherwise.
      # @example
      #   Seesaw.unflag_decision(1, 1)
      def unflag_decision(user_id, decision_id)
        boolean_from_response :post, "users/#{user_id}/decisions/#{decision_id}/unflag"
      end
    end
  end
end
