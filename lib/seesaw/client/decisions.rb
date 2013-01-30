module Seesaw
  class Client
    module Decisions
      def decision(user_id, decision_id)
        get "users/#{user_id}/decisions/#{decision_id}"
      end
    end
  end
end
