require_relative 'item'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
    instance = Item.new(publish_date)
  end

  def add_item(instance)
    @items.push(instance)
  end
end
