class Pagination::Handler
  DEFAULT_PER_PAGE = 10

  def initialize(scope:, page:, path:)
    @scope = scope
    @page = page
    @path = path
  end

  def execute
    total_pages, links = Pagination::JsonApi.new(records:, page: @page, path: @path).execute
    [records, total_pages, links]
  end

  private

  def records
    @records ||= @scope.page(@page).per(DEFAULT_PER_PAGE)
  end
end
