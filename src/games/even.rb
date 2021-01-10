# frozen_string_literal: true

require_relative '../gamePair'
require_relative 'base_game'

class Even < BaseGame

  def initialize
    super('Answer "yes" if number even otherwise answer "no".')
  end

  def generate
    number = rand(1000)
    question = "Is number #{number} even?"
    answer = number.even? ? 'yes' : 'no'
    GamePair.new(question, answer)
  end

end
