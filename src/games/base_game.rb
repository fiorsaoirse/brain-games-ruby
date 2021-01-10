require_relative '../engine'
require_relative '../gamePair'

class BaseGame
  include GameEngine

  def initialize(description)
    @description = description
  end

  def start
    start_game(@description, self)
  end
end
