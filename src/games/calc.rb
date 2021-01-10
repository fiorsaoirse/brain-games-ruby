require_relative '../gamePair'
require_relative 'base_game'

class Calc < BaseGame

  OPERANDS = %w[+ - * /].freeze

  def initialize
    super('What is the result of the expression?')
  end

  def calculate(first_number, second_number, operator)
    case operator
    when '+'
      first_number + second_number
    when '-'
      first_number - second_number
    when '*'
      first_number * second_number
    when '/'
      (first_number / second_number.to_f).round(2)
    else
      throw "Can not find operator #{operator}"
    end
  end

  private :calculate

  def generate
    first_number = rand(100)
    second_number = rand(100)
    index = rand(OPERANDS.size)
    operator = OPERANDS[index]
    question = "Question: #{first_number} #{operator} #{second_number}"
    question << "\n*round to two decimal" if operator == '/'
    answer = calculate(first_number, second_number, operator)
    GamePair.new(question, answer)
  end

end
