require 'date'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date='2021-01-01', archived: false)
    @publisher = publisher
    @cover_state = cover_state
  end

  # private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

martin = Book.new('Martin', 'bad')

puts martin.can_be_archived?
