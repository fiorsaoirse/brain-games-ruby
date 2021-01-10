# frozen_string_literal: true

require_relative '../gamePair'
require_relative 'base_game'

class Progression < BaseGame

  COUNT_OF_ELEMENTS = 10

  def initialize
    super('What number is missing in this progression?')
  end

  def gen_progression(first_element, step)
    result = []
    i = 0
    while i < COUNT_OF_ELEMENTS
      result << first_element + step * i
      i += 1
    end
    result
  end

  private :gen_progression

  def generate
    start = rand(100)
    step = rand(20)
    progression = gen_progression(start, step)
    random_index = rand(COUNT_OF_ELEMENTS.size)
    answer = progression[random_index]
    progression[random_index] = '...'
    question = "Question: #{progression.join(', ')}"
    GamePair.new(question, answer)
  end

end
