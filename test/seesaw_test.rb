require 'test_helper'

class SeesawTest < Seesaw::TestCase
  def test_respond_to
    assert Seesaw.respond_to?(:new, true)
  end

  def test_new
    assert_equal Seesaw.new.class, Seesaw::Client
  end

  def test_method_missing
    VCR.use_cassette 'users/user' do
      assert_equal 'gotwalt', Seesaw.user('gotwalt').username
    end
  end
end
