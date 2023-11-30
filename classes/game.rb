require_relative 'item'
<<<<<<< HEAD:class/game.rb

class Game < Item
  def initialize(multiplayer, last_played_at)
    super(publish_date, archived: false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end

game = Game.new(true, '2023-02-12')
puts game.can_be_archived?

# run this file to check
# That the can_be_archived method is successfully called
=======
require 'date'

class Game < Item
  attr_accessor :publish_date, :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && (Date.today - @last_played_at > 2)
  end
end
>>>>>>> dev:classes/game.rb
