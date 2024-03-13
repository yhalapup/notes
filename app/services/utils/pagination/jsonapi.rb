class Utils::Pagination::Jsonapi
  def initialize(records:, page:, path:)
    @records = records
    @page = page
    @path = path
  end

  def execute
    [total_pages, links]
  end

  private

  def total_pages
    {
      meta: { totalPages: @records.total_pages }
    }
  end

  def links
    {
      links: {
        self: build_link(page: @page),
        first: build_link(page: 1),
        last: build_link(page: @records.total_pages),
        prev: build_link(page: @records.prev_page),
        next: build_link(page: @records.next_page)
      }
    }
  end

  def build_link(page:)
    page.nil? ? @path : link_with_query_params(page)
  end

  def link_with_query_params(page)
    "#{@path}?#{{ page: }.to_query}"
  end
end
