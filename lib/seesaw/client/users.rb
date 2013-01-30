module Seesaw
  class Client
    module Users
      # Get the current user
      #
      # Requires authenticatied client.
      #
      # @return [Hashie::Mash]
      # @see Seesaw::Client
      # @example
      #   client.me
      def me
        get 'me'
      end

      # Get a single user
      #
      # @param user [String] A Seeaw username or ID.
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.user('soffes')
      def user(username_or_id)
        get "users/#{username_or_id}"
      end

      # Follow a user.
      #
      # Requires authenticatied client.
      #
      # @param user [String] Username or ID of the user to follow.
      # @return [Boolean] True if follow was successful, false otherwise.
      # @see Seesaw::Client
      # @example
      #   client.follow('gotwalt')
      def follow(username_or_id)
        boolean_from_response :post, "users/#{username_or_id}/follow"
      end

      # Unfollow a user.
      #
      # Requires authenticatied client.
      #
      # @param user [String] Username or ID of the user to unfollow.
      # @return [Boolean] True if unfollow was successful, false otherwise.
      # @see Seesaw::Client
      # @example
      #   client.unfollow('kyle')
      def unfollow(username_or_id)
        boolean_from_response :post, "users/#{username_or_id}/unfollow"
      end
    end
  end
end
