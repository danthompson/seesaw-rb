require 'test_helper'

class VotesTest < Seesaw::TestCase
  def test_create_vote
    VCR.use_cassette 'votes/create' do
      vote = Seesaw.create_vote(5, 3276, 5381, unique_id: '021a997')
      assert_equal 5381, vote.choice_id

      # Prevent duplicates
      assert_raises Seesaw::BadRequest do
        Seesaw.create_vote(5, 3276, 5381, unique_id: '021a997')
      end
    end
  end
end
