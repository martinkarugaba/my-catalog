class Item {
    def initialize(genre, author, source, label, date, archived: false){
        @genre = genre
        @author = author
        @source = source
        @publish_date = date
        @archived = archived
    }

    def can_be_archived?()
        @archived
    end

    def move_to_archive()
    end
}