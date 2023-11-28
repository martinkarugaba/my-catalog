require_relative 'item'

class Game < Item
    def initialize(multiplayer, last_played_at)
        super(publish_date, archived: false)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end
end

game = Game.new(true, "2023-02-12") # I have created this game instance of the game class to test only
p game
# p game.can_be_archived? To test if this method (can_be_archived) had been properly inherited,
# remove the comment and run the file