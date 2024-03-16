class Notes::Search
  def initialize(title:, content:)
    @title = title
    @content = content
  end

  def execute
    Note.where("LOWER(title) LIKE ? OR LOWER(content) LIKE ?", "%#{@title.downcase}%", "%#{@content.downcase}%")
  end
end
