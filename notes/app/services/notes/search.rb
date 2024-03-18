class Notes::Search
  def initialize(query:)
    @query = query.presence
  end

  def execute
    return [] if @query.nil?

    Note.where("LOWER(title) OR LOWER(content) LIKE ?", "%#{@query.downcase}%" )
  end
end
