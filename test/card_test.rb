require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

def test_does_card_exist
  card = Card.new("What is the capital of Alaska?", "Juneau")
  assert_instance_of Card, card
end

def test_does_card_have_question
  card = Card.new("What is the capital of Alaska?", "Juneau")
  assert_equal "What is the capital of Alaska?", card.question
end

def test_does_card_have_answer
  card = Card.new("What is the capital of Alaska?", "Juneau")
  assert_equal "Juneau", card.answer

end
end
