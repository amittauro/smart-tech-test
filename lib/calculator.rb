require_relative 'log'
class Calculator

  def get_page_views(logs)
    logs.each do |log|
      log.update_page_views(get_pages(logs).count(log.page))
    end
  end

  def get_unique_page_views(logs)
    get_unique(logs).each do |log|
      log.update_unique_page_views(get_unique_pages(logs).count(log.page))
    end
  end

  private

  def get_pages(logs)
    logs.map(&:page)
  end

  def get_unique(logs)
    logs.uniq { |log| log.page + log.ip }
  end

  def get_unique_pages(logs)
    get_unique(logs).map(&:page)
  end

end
