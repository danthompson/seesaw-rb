module Seesaw
  class Client
    # Client methods for working with votes
    module Votes
      # Create a vote.
      #
      # @param decision_user_id [Fixnum] the decision's owner's ID
      # @param decision_id [Fixnum] the decision's ID
      # @param choice_id [Fixnum] the choice's ID
      # @param options [Hash] specifiy `:unique_id` or `:invitation_slug`
      def create_vote(decision_user_id, decision_id, choice_id, options = {})
        unique_id = options[:unique_id]
        raise UniqueIDRequired unless unique_id or self.authenticated?

        path = "users/#{decision_user_id}/decisions/#{decision_id}/votes"
        params = { choice_id: choice_id, unique_id: unique_id }

        slug = options[:invitation_slug]
        params[:invitation] = { slug: slug } if slug and slug[0] == 'i'

        post path, params
      end
    end
  end
end
