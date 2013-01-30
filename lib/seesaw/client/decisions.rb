module Seesaw
  class Client
    module Decisions
      def decision(user_id, decision_id)
        get "users/#{user_id}/decisions/#{decision_id}"
      end

      def create_decision(user_id)
        post "users/#{user_id}/decisions"
      end

      def publish_decision(user_id, decision_id)
        post "users/#{user_id}/decisions/#{decision_id}/publish"
      end

      def destroy_decision(user_id, decision_id)
        boolean_from_response :delete, "users/#{user_id}/decisions/#{decision_id}"
      end

      def decision_analytics(user_id, decision_id)
        get "users/#{user_id}/decisions/#{decision_id}/analytics"
      end

      def flag_decision(user_id, decision_id)
        boolean_from_response :post, "users/#{user_id}/decisions/#{decision_id}/flag"
      end

      def unflag_decision(user_id, decision_id)
        boolean_from_response :post, "users/#{user_id}/decisions/#{decision_id}/unflag"
      end

    end
  end
end
