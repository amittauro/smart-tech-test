require 'pry'

class PageViews

  attr_reader :list, :logs

  def initialize
    @list = {}
  end

  def order(logs)
  end

  def count(logs)
    @logs = logs
    get_pages.each do |page|
      list[page] = pages.count(page)
    end
    list
  end

  private

  def get_pages
    logs.map { |log| log[0] }
  end



end
