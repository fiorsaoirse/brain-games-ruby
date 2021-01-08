# frozen_string_literal: true

class GamePair
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  attr_reader :question, :answer
end
