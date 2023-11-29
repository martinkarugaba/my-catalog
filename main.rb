class Main
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
  end

  def start
    loop do
      puts ''
      welcome_message
      puts ''
      display_menu
      choice = get_user_choice
      

      case choice
      when 1 then list_all_books
      when 2 then list_all_music_albums
      when 3 then list_all_movies
      when 4 then list_all_games
      when 5 then list_all_genres
      when 6 then list_all_labels
      when 7 then list_all_authors
      when 8 then list_all_sources
      when 9 then add_book
      when 10 then add_music_album
      when 11 then add_movie
      when 12 then add_game
      when 13 then break # Exit the loop and end the program
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def display_menu
   
    puts ""
    puts "1. List all books"
    puts "2. List all music albums"
    puts "3. List all movies"
    puts "4. List all games"
    puts "5. List all genres"
    puts "6. List all labels"
    puts "7. List all authors"
    puts "8. List all sources"
    puts "9. Add a book"
    puts "10. Add a music album"
    puts "11. Add a movie"
    puts "12. Add a game"
    puts "13. Quit"
  end

  def get_user_choice
    print "Enter your choice (1-13): "
    gets.chomp.to_i
  end

  def welcome_message
    print 'Welcome to My App (copyright @Martin @Ahmed, @Enoh)'
  end

  def list_all_books
    print 'Not Implemented yet'
  end

  def list_all_music_albums
    print 'Not Implemented yet'
  end

  def list_all_movies
    print 'Not Implemented yet'
  end

  def list_all_games
    print 'Not Implemented yet'
  end

  def list_all_genres
    print 'Not Implemented yet'
  end

  def list_all_labels
    print 'Not Implemented yet'
  end

  def list_all_authors
    print 'Not Implemented yet'
  end

  def list_all_sources
    print 'Not Implemented yet'
  end

  def add_book
    print 'Not Implemented yet'
  end

  def add_music_album
    print 'Not Implemented yet'
  end

  def add_movie
    print 'Not Implemented yet'
  end

  def add_game
    print 'Not Implemented yet'
  end
end

app = Main.new
app.start
