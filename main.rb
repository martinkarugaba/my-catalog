require_relative 'app'
require_relative 'refactor'

def main
  puts 'Welcome to the Catalog of my things App!'
  puts '----------------------------------------'
  app = App.new
  refactor = Refactor.new(app)
  app.load_data
  loop do
    puts 'Please select an option by entering a number:'
    puts '     1. List all books'
    puts '     2. List all music albums'
    puts '     3. List of games'
    puts '     4. List all labels'
    puts '     5. List all genres'
    puts '     6. List all authors'
    puts '     7. Add a book'
    puts '     8. Add a music album'
    puts '     9. Add a game'
    puts '     10. Add an author'
    puts '     11. Exit'
    options = gets.chomp.to_i
    case options
    when 1
      app.list_all_books
    when 2
      app.list_all_music_albums
    when 3
      app.list_games
    when 4
      app.list_all_labels
    when 5
      app.list_all_genres
    when 6
      app.list_authors
    when 7
      refactor.add_book
    when 8
      app.add_music_album
    when 9
      app.add_game
    when 10
      app.add_author
    when 11
      app.save_data
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end
main
