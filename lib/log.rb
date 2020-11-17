class Log

  attr_reader :page, :ip, :page_views, :unique_page_views

  def initialize(page, ip)
    @page = page
    @ip = ip
    @page_views = nil
    unique_page_views = nil
  end

  def update_page_views(views)
    page_views = views
  end

  def update_unique_page_views(views)
    unique_page_views = views
  end

end
