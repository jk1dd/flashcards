require 'pry'
require_relative 'deck'

class Round
  attr_reader :deck

  attr_accessor :guesses,
                :correct_count

  def initialize(deck)
    @deck = deck
    @guesses = []
    @correct_count = 0
  end

  def current_card
    @current_card = @deck.cards[guesses.count]
  end

  def record_guess(guess)
    current_guess = Guess.new(guess, current_card)
    @guesses << (current_guess)
    current_guess
  end

  def number_correct
    guesses.each do |guess|
      if guess.correct?
        @correct_count += 1
      end
    end
    @correct_count
  end

  def percent_correct
    ((@correct_count.to_f / guesses.count) * 100).to_i
  end

  def start
    puts "Welcome! You are playing with #{deck.count} cards."
    puts "---------------------------------------------------"
    deck.cards.each do |card|
      puts "This card is #{(deck.cards.index(current_card))+ 1} of #{deck.count}"
      puts "#{current_card.question}"
      user_guess = gets.chomp
      record_guess(user_guess)

      puts "#{guesses.last.feedback}"
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} out of #{deck.count} for a score of #{percent_correct}%"
  end

end
