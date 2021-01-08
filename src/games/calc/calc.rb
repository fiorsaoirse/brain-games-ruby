require_relative '../../engine'
require_relative '../../gamePair'

class Calc
  include GameEngine

  DESCRIPTION = 'What is the result of the expression?'.freeze
  OPERANDS = %w[+ - * /].freeze

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
    @first_number = rand(100)
    @second_number = rand(100)
    @index = rand(OPERANDS.size)
    @operator = OPERANDS[@index]
    @question = "Question: #{@first_number} #{@operator} #{@second_number}"
    @question << "\n*round to two decimal" if @operator == '/'
    @answer = calculate(@first_number, @second_number, @operator)
    GamePair.new(@question, @answer)
  end

  def start
    start_game(DESCRIPTION, self)
  end
end
