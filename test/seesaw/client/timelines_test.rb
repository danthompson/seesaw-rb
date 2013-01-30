require 'test_helper'

class TimelinesTest < Seesaw::TestCase
  def test_global
    VCR.use_cassette 'timelines/global' do
      assert_equal 15, Seesaw.global_timeline(15).length
    end
  end
end
