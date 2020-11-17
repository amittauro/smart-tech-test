require 'pry'
require_relative 'log'

class Pages

  attr_reader :list, :logs

  def initialize
    @list = {}
  end

  def order(logs)
    @logs = logs
    count(logs)
    logs.uniq! { |log| log.page }
    logs.sort_by! { |log| log.page_views }.reverse!
  end

  def count(logs)
    @logs = logs
    logs.each do |log|
      binding.pry
      log.update_page_views(get_pages.count(log.page))
    end
    binding.pry
  end

  private

  def get_pages
    logs.map { |log| log.page }
  end



end
