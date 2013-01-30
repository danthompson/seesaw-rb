require 'test_helper'

class ClientTest < SeesawTest
  def test_initialization
    client = Seesaw::Client.new('asdf1234')
    assert_equal 'asdf1234', client.access_token
  end
end
