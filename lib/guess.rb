require_relative 'card'
class Guess

  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
   @response == card.answer
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
