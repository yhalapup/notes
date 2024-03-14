class NotesObtainer
  def execute
    notes
  end

  private

  def notes
    (1..5).each_with_object([]) do |_i, a|
      a << {
        id: uuid,
        title:,
        content:
      }
    end
  end

  def uuid
    SecureRandom.uuid
  end

  def title
    Faker::Movie.title
  end

  def content
    Faker::Movie.quote
  end
end
