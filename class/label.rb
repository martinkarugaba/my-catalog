require_relative 'item'

class Label < Item
  attr_reader :id
  attr_accessor :items, :title, :color

  def initialize(title, color)
    super()
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end