require_relative '../classes/game'
require_relative '../classes/item'
require 'date'
describe Game do
  before :each do
    @game = Game.new('2000/10/25', true, '2020/08/13')
  end
  describe '#new' do
    it 'returns instance of the Game class' do
      expect(@game).to be_an_instance_of(Game)
    end
  end
  describe '#publish_date' do
  it 'return the date which game published at' do
    expect(@game.publish_date).to eq('2000/10/25') # Adjust the format as needed
  end
end
  describe '#mulitplayer' do
    it 'returning true if the game is multiplayer' do
      expect(@game.multiplayer).to be_truthy
    end
  end
  describe '#last_played_at' do
    it 'return the date which game last_played_at' do
      expect(@game.last_played_at.to_s).to eq('2020-08-13') # Adjust the format as needed
    end
  end
  describe Game do
  it '#can_be_archived? returns true if it is archived and last played more than 2 days ago' do
    game = Game.new('2004-03-04', false, (Date.today - 3).to_s)
    expect(game.can_be_archived?).to be_truthy
  end
end
end
