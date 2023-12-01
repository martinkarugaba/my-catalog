require_relative '../classes/movie'
require_relative '../classes/item'
require 'date'
require 'rspec'
describe Movie do
  before :each do
    @movie = Movie.new(true, '2000-01-01', false)
  end
  describe '#new' do
    it 'returns an instance of the Movie class' do
      expect(@movie).to be_an_instance_of(Movie)
    end
  end
  describe '#silent' do
    it 'returns the silent status of the movie' do
      expect(@movie.silent).to be_truthy
    end
  end
  describe '#publish_date' do
    it 'returns the publish date of the movie' do
      expect(@movie.publish_date.to_s).to eq('2000-01-01')
    end
  end
  describe '#archived' do
    it 'returns the archived status of the movie' do
      expect(@movie.archived).to be_falsy
    end
  end
  describe Movie do
    it '#can_be_archived? returns true if it is archived or silent, otherwise false' do
      movie = Movie.new(true, '2004-03-04', false)
      expect(movie.can_be_archived?).to be_truthy
    end
  end
end
