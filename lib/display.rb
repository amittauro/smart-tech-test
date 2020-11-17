class Display

  def create(logs)
    logs.each do |log|
      puts "#{log.page} #{log.page_views} visits"
    end
  end

  def create_unique(logs)
    logs.each do |log|
      puts "#{log.page} #{log.unique_page_views} visits"
    end
  end
end
