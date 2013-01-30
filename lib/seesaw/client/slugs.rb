module Seesaw
  class Client
    module Slugs
      # Get a slug.
      #
      # @param id [String] the slug id
      # @param unique_id [String] an optional tracking string
      # @return [Hashie::Mash]
      # @example
      #   Seesaw.slug('d/3I0n0g')
      def slug(id, unique_id = nil)
        path =  "slugs/#{id}"
        path += "?unique_id=#{unique_id}" if unique_id
        get path
      end
    end
  end
end
