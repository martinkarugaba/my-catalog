require_relative 'item'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(publish_date)
    instance = Item.new(publish_date)
    @items.push(instance)
  end
end
