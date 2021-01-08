# frozen_string_literal: true
module GameEngine
  MAX_COUNT = 3

  def start_game(description, game)
    puts "\nWelcome to the Brain Games"
    puts 'May I have your name?'
    @user_name = gets.chomp
    puts "Hello, #{@user_name}\n"
    puts description

    iter = lambda { |count = 0|
      if count >= MAX_COUNT
        puts "Congratulations, #{@user_name}! You win!"
        return
      else
        @current_game = game.generate
        @question = @current_game.question
        puts @question
        @correct_answer = @current_game.answer.to_s
        puts 'Your answer?'
        @user_answer = gets.chomp
        if @user_answer == @correct_answer
          iter.call(count + 1)
        else
          puts "#{@user_answer} is wrong answer. \nCorrect answer is #{@correct_answer}.\nLet's try again!"
        end
      end
    }
    iter.call
  end
end