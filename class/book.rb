class Book
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    # implementation goes here
    # return true or false based on some condition
  end

  private

  def some_private_method
    # implementation goes here
  end
end
