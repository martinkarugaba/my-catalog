class ParentItem
  attr_accessor :source, :archived

  def initialize(source, **options)
    @source = source
    @archived = options.fetch(:archived, false)
  end
end
