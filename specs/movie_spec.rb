

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
    end
  end
end
