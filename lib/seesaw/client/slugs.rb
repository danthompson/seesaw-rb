module Seesaw
  class Client
    module Slugs
      # Get a slug.
      #
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.slug('d/3I0n0g')
      def slug(id)
        get "slugs/#{id}"
      end
    end
  end
end
