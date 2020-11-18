class Report

  def create(logs)
    ordered_page_views(logs).each do |log|
      puts "#{log.page} #{log.page_views} visits"
    end

    unique_ordered_page_views(logs).each do |log|
      puts "#{log.page} #{log.unique_page_views} unique views"
    end
  end

  private

  def ordered_page_views(logs)
    get_unique(logs).sort_by(&:page_views).reverse
  end

  def unique_ordered_page_views(logs)
    get_unique(logs).sort_by(&:unique_page_views).reverse
  end

  def get_unique(logs)
    logs.uniq(&:page)
  end

end
