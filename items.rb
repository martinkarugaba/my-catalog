require_relative "parent_item"

class Item < ParentItem
  def initialize(genre, author, source, label, date)
    super(source, false)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = date
  end

  def can_be_archived?() end

  def move_to_archive() end
end

item = Item.new('music', 'collins', 'source', 'readng', '2018-01-03')
p item
