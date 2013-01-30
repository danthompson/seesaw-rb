require 'test_helper'

class UsersTest < Seesaw::TestCase
  def test_me
    VCR.use_cassette 'users/me' do
      user = local_client.me
      assert_equal 'test123', user.username
    end
  end

  def test_user
    VCR.use_cassette 'users/user' do
      client = Seesaw::Client.new
      user = client.user('gotwalt')
      assert_equal 'gotwalt', user.username
    end
  end

  def test_following
    VCR.use_cassette 'users/following' do
      assert local_client.follow('gotwalt'), 'follow user'
      assert local_client.unfollow('gotwalt'), 'unfollow user'

      # Still true, even if you aren't following them
      assert local_client.unfollow('gotwalt'), 'unfollow user twice'

      # False if user isn't found
      refute local_client.follow('nobody'), 'follow nobody'
      refute local_client.follow('unnobody'), 'unfollow nobody'
    end
  end
end
