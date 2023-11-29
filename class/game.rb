require_relative 'item'

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
