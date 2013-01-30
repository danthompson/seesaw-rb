require 'test_helper'

class SlugsTest < Seesaw::TestCase
  def test_slug
    VCR.use_cassette 'slugs/show' do
      client = Seesaw::Client.new
      slug = client.slug('d/3I0n0g')
      assert_equal 'soffes', slug.decision.user.username
    end
  end
end
