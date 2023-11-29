require 'rspec'
require_relative 'book'

describe Book do
  let(:book) { Book.new('Publisher', cover_state) }

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      let(:cover_state) { 'bad' }

      it 'returns true' do
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when cover_state is not bad' do
      let(:cover_state) { 'good' }

      it 'returns false' do
        expect(book.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
