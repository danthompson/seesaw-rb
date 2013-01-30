require 'net/http'
require 'net/https'
require 'uri'
require 'multi_json'
require 'hashie'

require 'seesaw/client/users'
require 'seesaw/client/decisions'
require 'seesaw/client/slugs'
require 'seesaw/client/timelines'
require 'seesaw/client/choices'

module Seesaw
  # API client for interacting with the Seesaw API
  class Client
    include Seesaw::Client::Decisions
    include Seesaw::Client::Users
    include Seesaw::Client::Slugs
    include Seesaw::Client::Timelines
    include Seesaw::Client::Choices

    attr_reader :access_token
    attr_reader :api_scheme
    attr_reader :api_host
    attr_reader :api_version

    # Initialize a new client.
    #
    # @param options [Hash] optionally specify `:access_token`, `:api_scheme`, `:api_host`, or `:api_version`
    def initialize(options = {})
      options = { access_token: options } if options.is_a? String

      @access_token = options[:access_token] if options[:access_token]
      @api_scheme = (options[:api_scheme] or 'https')
      @api_host = (options[:api_host] or 'api.seesaw.co')
      @api_version = (options[:api_version] or 1)
    end

    # API base URL.
    #
    # @return [String] API base URL
    def base_url
      "#{@api_scheme}://#{@api_host}/v#{@api_version}/"
    end

    # Is the client has an access token.
    #
    # @return [Boolean] true if it is using one and false if it is not
    def authenticated?
      @access_token != nil and @access_token.length > 0
    end

    # Is the client using SSL.
    #
    # @return [Boolean] true if it is using SSL and false if it is not
    def ssl?
      @api_scheme == 'https'
    end

  private

    def http
      return @http if @http

      uri = URI.parse(self.base_url)
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = self.ssl?
      @http
    end

    def request(method, path, params = nil)
      # Request
      uri = URI.parse("#{self.base_url}#{path}")
      request = case method
        when :get
          Net::HTTP::Get.new(uri.request_uri)
        when :post
          Net::HTTP::Post.new(uri.request_uri)
        when :put
          Net::HTTP::Put.new(uri.request_uri)
        when :delete
          Net::HTTP::Delete.new(uri.request_uri)
      end

      request['Authorization'] = "Bearer #{self.access_token}" if authenticated?
      request['Content-Type'] = 'application/json'

      request.body = MultiJson.dump(params) if method == :post and params

      # Request
      response = http.request(request)

      # Check for errors
      raise error if error = Seesaw::ERROR_MAP[response.code]

      response
    end

    def json_request(*args)
      # Preform request
      response = request(*args)

      # Parse
      object = MultiJson.load(response.body)
      return Hashie::Mash.new(object) if object.is_a? Hash
      return object.map { |h| Hashie::Mash.new(h) } if object.is_a? Array

      object
    end

    def boolean_from_response(*args)
      response = request(*args)
      (200..299).include? response.code.to_i
    end

    [:get, :post, :put, :delete].each do |method|
      define_method method do |*args|
        json_request(method, *args)
      end
    end
  end
end
