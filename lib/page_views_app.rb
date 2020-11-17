require_relative 'parser'

class PageViewsApp

  attr_reader :parser, :page_views, :unique_page_views

  def initialize(parser = Parser.new,  page_views = PageViews.new, unique_page_views = UniquePageViews.new)
    @parser = parser
    @page_views = page_views
    @unique_page_views = unique_page_views
  end

  def run
    parser.translate_log_to_hash
    page_views.order(parser.hash_of_logs)
    unique_page_views.order(parser.hash_of_logs)
  end

end
