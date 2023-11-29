class Label
  attr_accessor :title, :color

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.labels.include?(self)
  end

  private

  attr_reader :id, :items
end
