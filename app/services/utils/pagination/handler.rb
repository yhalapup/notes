class Utils::Pagination::Handler
  def initialize(scope:, page:, path:)
    @scope = scope
    @page = page
    @path = path
  end

  def execute
    total_pages, links = Utils::Pagination::Jsonapi.new(records:, page: @page, path: @path).execute
    [records, total_pages, links]
  end

  private

  def records
    @records ||= @scope.page(@page).per(per_page=default_per_page)
  end

  def default_per_page
    2
  end
end
