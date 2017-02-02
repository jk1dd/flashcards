require_relative 'round'
require 'pry'


card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
card_3 = Card.new("What is the best drink?", "Water")
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)


round.start
