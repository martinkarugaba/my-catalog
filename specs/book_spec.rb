require_relative '../classes/book'

describe Book do
  describe '#initialize' do
    it 'creates a new book object' do
      book = Book.new('Title', 'Author', 2022)
      expect(book).to be_instance_of(Book)
    end
  end
end
