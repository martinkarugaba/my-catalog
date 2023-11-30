require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(silent, publish_date, archived)
    super(publish_date, archived)
    @silet = silent
  end

  def can_be_archived?
    super || @silent
  end   
end

movie = Movie.new(true, '2004-03-04', false)
p movie.can_be_archived?