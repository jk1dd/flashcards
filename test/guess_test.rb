require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_does_guess_exist
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
  end

  def test_can_access_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end

  def test_has_user_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_has_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end

  def test_gives_feedback_affirmative
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_has_incorrect_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    refute guess.correct?
  end

  def test_gives_feedback_negative
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Incorrect.", guess.feedback
  end

end
