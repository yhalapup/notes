class Notes::Search
  def initialize(query:)
    @query = query.presence
  end

  def execute
    return Note.none if @query.nil?

    Note.where("title like ?", "%#{@query}%").or(Note.where("content like ?", "%#{@query}%")).distinct
  end
end
