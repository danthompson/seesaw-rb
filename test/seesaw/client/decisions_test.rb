require 'test_helper'

class DecisionsTest < Seesaw::TestCase
  def test_decision
    VCR.use_cassette 'decisions/show' do
      decision = Seesaw.decision(5, 3276)
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

  def test_publish_decision
    VCR.use_cassette 'decisions/publish' do
      client = local_client
      decision = client.create_decision(1)
      choice = create_test_choice(client, decision.user_id, decision.id)
      result = client.publish_decision(decision.user_id, decision.id, question: 'Why is the sky blue?')
      assert result.published_at
      assert 1, result.choices.length
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

  private

  def create_test_choice(client, user_id, decision_id)
    data = {
      image_url: 'http://recess.s3.amazonaws.com/default_avatars/v1/photo_1.png',
      subject: 'Test Image',
      link_url: 'http://seesaw.co',
      link_title: 'Seesaw'
    }
    client.create_choice_for_image(user_id, decision_id, data)
  end
end
