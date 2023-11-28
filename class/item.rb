require 'date'

class Item
  attr_accessor :genres, :authors, :labels, :source, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @labels << label unless @labels.include?(label)
  end

  def author=(author)
    @authors << author unless @authors.include?(author)
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def can_be_archived? # we still have to look at this method when everthing else is fully understood
    current_date = Date.today
    if @publish_date.nil?
      @archived = false
    else
      if (current_date.year - @publish_date) / 365.5 >= 10
       @archived = true
      else @archived = false
      end
    end
  end
end

item = Item.new('2003-02-03')
p item



