require 'net/http'
require 'net/https'
require 'uri'
require 'multi_json'

module Seesaw
  class Client
    attr_reader :access_token
    attr_reader :api_scheme
    attr_reader :api_host
    attr_reader :api_version

    def initialize(access_token = nil, options = {})
      @access_token = access_token
      @api_scheme = (options[:api_scheme] or 'https')
      @api_host = (options[:api_host] or 'api.seesaw.co')
      @api_version = (options[:api_version] or 1)
    end

    def base_url
      "#{@api_scheme}://#{@api_host}/v#{@api_version}/"
    end

    def authenticated?
      @access_token != nil and @access_token.length > 0
    end

    def ssl?
      @api_scheme == 'https'
    end

    def user
      get 'me'
    end

  private

    def http
      return @http if @http

      uri = URI.parse(self.base_url)
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = self.ssl?
      @http
    end

    def get(path, params = nil)
      # Request
      uri = URI.parse("#{self.base_url}#{path}")
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = "Bearer #{self.access_token}" if authenticated?
      request.set_form_data(params) if params

      # Response
      response = http.request(request)

      # Parse
      MultiJson.load(response.body)
    end
  end
end
