require 'test_helper'

class ClientTest < Seesaw::TestCase
  def test_initialization
    client = Seesaw::Client.new(access_token: 'asdf1234')
    assert_equal 'asdf1234', client.access_token
    assert client.authenticated?

    client = Seesaw::Client.new('asdf1234')
    assert_equal 'asdf1234', client.access_token

    client = Seesaw::Client.new
    refute client.authenticated?
  end

  def test_base_url
    client = Seesaw::Client.new
    assert_equal 'https://api.seesaw.co/v1/', client.base_url

    client = Seesaw::Client.new(api_scheme: 'http', api_host: 'example.com', api_version: 42)
    assert_equal 'http://example.com/v42/', client.base_url
  end

  def test_ssl?
    client = Seesaw::Client.new
    assert client.ssl?

    client = Seesaw::Client.new(api_scheme: 'http')
    refute client.ssl?
  end
end
