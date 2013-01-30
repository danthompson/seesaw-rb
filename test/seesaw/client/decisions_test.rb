require 'test_helper'

class DecisionsTest < Seesaw::TestCase
  def test_decision
    VCR.use_cassette 'decisions/show' do
      client = Seesaw::Client.new
      decision = client.decision(5, 3276)
      assert_equal 'Which lamp for the new apartment?', decision.question
    end
  end

  def test_create_decision
    VCR.use_cassette 'decisions/create' do
      client = local_client
      decision = client.create_decision(1)
      assert_equal 1, decision.id
      assert_equal 1, decision.user_id
      assert decision.timeline_key
    end
  end

  def test_destroy_decision
    VCR.use_cassette 'decisions/destroy' do
      client = local_client
      decision = client.create_decision(1)
      assert client.destroy_decision(decision.user_id, decision.id)
    end
  end

  def test_decision_analytics
    VCR.use_cassette 'decisions/analytics' do
      client = local_client
      decision = client.create_decision(1)
      analytics = client.decision_analytics(decision.user_id, decision.id)
      assert_equal 0, analytics.total_votes
    end
  end

  def test_flag_decision
    VCR.use_cassette 'decisions/flag' do
      client = local_client
      decision = client.create_decision(1)
      assert client.flag_decision(decision.user_id, decision.id)
    end
  end

  def test_unflag_decision
    VCR.use_cassette 'decisions/unflag' do
      client = local_client
      decision = client.create_decision(1)
      assert client.flag_decision(decision.user_id, decision.id)
      assert client.unflag_decision(decision.user_id, decision.id)
    end
  end
end
