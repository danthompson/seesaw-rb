module Seesaw
  class Client
    module Choices
      # Get a single choice
      #
      # @param user_id [Numeric] The choice's decision's user id
      # @param decision_id [Numeric] The choice's decision's id
      # @param choice_id [Numeric] The choice's id
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.choice(1, 1, 1)
      def choice(user_id, decision_id, choice_id)
        get "users/#{user_id}/decisions/#{decision_id}/choices/#{choice_id}"
      end


      # Create a new choice using a supplied image url
      #
      # @param user_id [Numeric] The choice's decision's user id
      # @param decision_id [Numeric] The choice's decision's id
      # @param options [Hash]
      # @option options [String] :image_url The image url (required)
      # @option options [String] :subject The image label
      # @option options [String] :link_url A link to this image's page
      # @option options [String] :link_title The title of a link to this image's page
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.create_choice_for_image(1, 1, image_url: 'http://recess.s3.amazonaws.com/default_avatars/v1/photo_1.png', \
      #     subject: 'Sample Avatar', link_url: 'https://seesaw.co', link_title: 'Seesaw')
      def create_choice_for_image(user_id, decision_id, options = {})
        raise ArgumentError.new('image_url option is required') unless options[:image_url]

        data = {
          choice: {
            type: 'image',
            image_url: options[:image_url],
            subject: options[:subject],
            meta: {
              link_url: options[:link_url],
              link_title: options[:link_title]
            }
          }
        }

        post "users/#{user_id}/decisions/#{decision_id}/choices", data
      end

      # Create a new choice upload. Resulting hash contains an #upload parameter
      # providing keys necessary to perform a signed S3 upload.
      #
      # @param user_id [Numeric] The choice's decision's user id
      # @param decision_id [Numeric] The choice's decision's id
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.create_choice_upload(1, 1)
      def create_choice_upload(user_id, decision_id)
        post "users/#{user_id}/decisions/#{decision_id}/choices"
      end

      # Destroy a choice
      #
      # @param user_id [Numeric] The choice's decision's user id
      # @param decision_id [Numeric] The choice's decision's id
      # @param choice_id [Numeric] The choice's id
      # @return [Boolean] True if follow was successful, false otherwise.
      # @example
      #   Seesaw.destroy_choice(1, 1)
      def destroy_choice(user_id, decision_id, choice_id)
        boolean_from_response :delete, "users/#{user_id}/decisions/#{decision_id}/choices/#{choice_id}"
      end
    end
  end
end
