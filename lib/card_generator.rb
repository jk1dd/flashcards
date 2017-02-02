# require_relative 'flashcard_runner'
#
# class CardGenerator
#
#   attr_reader :filename, :generator
#
#   def initialize(filename="cards.txt")
#     @filename = filename
#     @generator = generator
#   end
#
#   def generator
#     File.open(@filename).readlines.map do |line|
#       question, answer = line.chop!.split(",")
#       Card.new(question, answer)
#     end
#   end
# end
