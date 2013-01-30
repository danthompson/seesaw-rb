require 'test_helper'

class VotesTest < Seesaw::TestCase
  def test_create_vote
    VCR.use_cassette 'votes/create' do
      vote = Seesaw.create_vote(5, 3276, 5381, '021a997d8aa785abed0a25c47b9a07be')
      assert_equal 5381, vote.choice_id

      # Prevent duplicates
      assert_raises Seesaw::BadRequest do
        Seesaw.create_vote(5, 3276, 5381, '021a997d8aa785abed0a25c47b9a07be')
      end
    end
  end
end
