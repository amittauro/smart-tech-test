class UniquePages

  attr_reader :logs

  def order(logs)
    @logs = logs
    logs.uniq! { |log| log.ip }
    count(logs)
    logs.uniq! { |log| log.page }
    logs.sort_by! { |log| log.unique_page_views }.reverse!
  end

  def count(logs)
    @logs = logs
    logs.each do |log|
      log.update_unique_page_views(get_pages.count(log.page))
    end
  end

  private

  def get_pages
    logs.map { |log| log.page }
  end
end
