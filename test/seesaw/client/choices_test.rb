require 'test_helper'

class ChoicesTest < Seesaw::TestCase
  def test_decision
    VCR.use_cassette 'choices/show' do
      client = local_client
      choice = client.choice(3, 12, 1)
      assert_equal 'ImageChoice', choice.type
    end
  end

  def test_create_choice_for_image
    VCR.use_cassette 'choices/create_for_image' do
      client = local_client
        data = {
        image_url: 'http://recess.s3.amazonaws.com/default_avatars/v1/photo_1.png',
        subject: 'Test Image',
        link_url: 'http://seesaw.co',
        link_title: 'Seesaw'
      }
      decision = client.create_decision(1)
      choice = client.create_choice_for_image(decision.user_id, decision.id, data)
      assert_equal data[:subject], choice.subject
      assert_equal data[:link_url], choice.meta.link_url
      assert_equal data[:link_title], choice.meta.link_title
      refute choice.respond_to?(:upload), 'should not have an upload form'
    end
  end

  def test_create_choice_upload
    VCR.use_cassette 'choices/create_choice_upload' do

      client = local_client
      decision = client.create_decision(1)
      choice = client.create_choice_upload(decision.user_id, decision.id)

      assert choice.respond_to?(:upload), 'should have an upload form'
    end
  end

  def test_destroy_choice
    VCR.use_cassette 'choices/destroy' do
      client = local_client
      decision = client.create_decision(1)
      choice = client.create_choice_upload(decision.user_id, decision.id)
      assert client.destroy_choice(decision.user_id, decision.id, choice.id)
    end
  end

end
