require 'rspec'
require_relative 'book'
require_relative 'app'

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

# test list all books
describe App do
  let(:app) { App.new }

  describe '#list_all_books' do
    before do
      @original_stdout = $stdout
      $stdout = StringIO.new
    end

    after do
      $stdout = @original_stdout
    end

    it 'prints a message if there are no books' do
      app.list_all_books
      expect($stdout.string).to include('No books added')
    end

    it 'prints all books if there are any' do
      book = Book.new('Publisher', 'Cover State', '2022-01-01')
      app.add_book(book)
      app.list_all_books
      expect($stdout.string).to include('1-[Book], ID: ')
      expect($stdout.string).to include(
        ', Publisher: Publisher, Publish Date: 2022-01-01, Cover State: Cover State, Archived: '
      )
    end
  end
end

# test add book to app
describe App do
  let(:app) { App.new }

  describe '#add_book' do
    before do
      @original_stdout = $stdout
      $stdout = StringIO.new
    end

    after do
      $stdout = @original_stdout
    end

    it 'adds a book to the books array' do
      expect { app.add_book('Publisher', 'Cover State', '2022-01-01') }.to change { app.books.length }.by(1)
    end

    it 'creates a book with the correct publisher, cover state, and publish date' do
      app.add_book('Publisher', 'Cover State', '2022-01-01')
      book = app.books.last
      expect(book.publisher).to eq('Publisher')
      expect(book.cover_state).to eq('Cover State')
      expect(book.publish_date).to eq(Date.parse('2022-01-01'))
    end

    it 'prints a success message' do
      app.add_book('Publisher', 'Cover State', '2022-01-01')
      expect($stdout.string).to include('The book is added successfully ✅📖')
    end
  end
end

# test ask load_books
describe App do
  let(:app) { App.new }

  describe '#load_books' do
    before do
      @original_stdout = $stdout
      $stdout = StringIO.new
    end

    after do
      $stdout = @original_stdout
    end

    context 'when the file does not exist' do
      before do
        allow(File).to receive(:exist?).and_return(false)
      end

      it 'sets @books to an empty array' do
        app.load_books
        expect(app.books).to eq([])
      end
    end

    context 'when the file exists' do
      before do
        allow(File).to receive(:exist?).and_return(true)
      end

      context 'when the file content is valid JSON' do
        before do
          allow(JSON).to receive(:parse).and_return([{ 'publish_date' => '2022-01-01', 'publisher' => 'Publisher',
                                                       'cover_state' => 'Cover State' }])
        end

        it 'loads books from the file' do
          app.load_books
          book = app.books.first
          expect(book.publish_date).to eq(Date.parse('2022-01-01'))
          expect(book.publisher).to eq('Publisher')
          expect(book.cover_state).to eq('Cover State')
        end
      end

      context 'when the file content is not valid JSON' do
        before do
          allow(JSON).to receive(:parse).and_raise(JSON::ParserError)
        end

        it 'prints an error message and sets @books to an empty array' do
          app.load_books
          expect($stdout.string).to include('Failed to parse books:')
          expect(app.books).to eq([])
        end
      end
    end
  end
end

# test save books

describe App do
  let(:app) { App.new }

  describe '#save_books' do
    let(:file) { double('file') }

    before do
      allow(File).to receive(:open).and_yield(file)
    end

    it 'writes the books to the file in JSON format' do
      book = Book.new('2022-01-01', 'Publisher', 'Cover State')
      app.add_book(book)
      expect(file).to receive(:write).with(JSON.generate([{
                                                           'id' => book.id,
                                                           'publish_date' => '2022-01-01',
                                                           'publisher' => 'Publisher',
                                                           'cover_state' => 'Cover State'
                                                         }]))
      app.save_books
    end
  end
end
