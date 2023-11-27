class ParentItem
    attr_accessor :source, :archived
  def initialize(source, archived = false)
    @source = source
    @archived = archived
  end
end
