<<<<<<< HEAD


require_relative '../classes/movie'

RSpec.describe 'Movie' do
  describe '#ask_spotify' do
    let(:mock_input) { StringIO.new }

    before do
      allow_any_instance_of(Kernel).to receive(:print)
      allow_any_instance_of(Kernel).to receive(:gets).and_return(mock_input)
    end

    context 'when user inputs "Y"' do
      it 'returns true' do
        mock_input.puts 'Y'
        mock_input.rewind
        expect(ask_spotify).to eq(true)
      end
    end

    context 'when user inputs "N"' do
      it 'returns false' do
        mock_input.puts 'N'
        mock_input.rewind
        expect(ask_spotify).to eq(false)
      end
    end

    context 'when user inputs invalid values initially and then inputs "Y"' do
      it 'returns true after valid input' do
        mock_input.puts 'invalid_input'
        mock_input.puts 'Y'
        mock_input.rewind
        expect(ask_spotify).to eq(true)
      end
=======
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
>>>>>>> 845a0d77806280cd80fe0467936a97b8ede2f664
    end
  end
end
