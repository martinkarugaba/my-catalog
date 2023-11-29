require_relative 'item'

class Author
  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(publish_date)
    @items << Item.new(publish_date)
  end
end

# author = Author.new('collins', 'Enoh')
# p author.id
# p author.add_item('2004-03-03')
