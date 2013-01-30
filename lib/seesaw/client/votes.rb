module Seesaw
  class Client
    # Client methods for working with votes
    module Votes
      # Create a vote.
      #
      # @param decision_user_id [Fixnum] the decision's owner's ID
      # @param decision_id [Fixnum] the decision's ID
      # @param choice_id [Fixnum] the choice's ID
      # @param unique_id [Fixnum] optional unique ID. This is required if there is no user.
      def create_vote(decision_user_id, decision_id, choice_id, unique_id = nil)
        raise UniqueIDRequired unless unique_id or self.authenticated?
        path = "users/#{decision_user_id}/decisions/#{decision_id}/votes"
        post path, { choice_id: choice_id, unique_id: unique_id }
      end
    end
  end
end
