require 'test_helper'

class DecisionsTest < Seesaw::TestCase
  def test_decision
    VCR.use_cassette 'decisions/show' do
      client = Seesaw::Client.new
      decision = client.decision(5, 3276)
      assert_equal 'Which lamp for the new apartment?', decision.question
    end
  end
end
