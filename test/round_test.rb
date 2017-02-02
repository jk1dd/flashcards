require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'

class RoundTest < Minitest::Test

  def test_does_round_exist
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_can_call_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_has_array_for_guess_collection
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
    assert_equal 0, round.guesses.count
  end

  def test_returns_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Card, round.current_card
  end

  def test_ability_to_record_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("Dog")
    #
    # assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal "Juneau", round.guesses[0].response
  end

  def test_can_count_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal 1, round.guesses.count

    round.record_guess("Dog")

    assert_equal 2, round.guesses.count
  end

  def test_can_give_positive_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_can_count_number_correct_with_both_incorrect_and_correct
    # skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("What is the capital of Colorado?", "Denver")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal 1, round.number_correct
    #
    # round.record_guess("93,000,000")
    # round.record_guess("Topeka")
    #
    # assert_equal 2, round.number_correct
  end

  def test_can_show_next_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal card_2, round.current_card
  end

  def test_can_give_negative_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_can_give_percent_correct 
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal 50, round.percent_correct
  end

end
