require_relative 'parser'
require_relative 'pages'
require_relative 'unique_pages'
require_relative 'display'
require 'pry'

class PageViewsApp

  attr_reader :parser, :pages, :unique_pages, :display

  def initialize(parser, pages = Pages.new, unique_pages = UniquePages.new, display = Display.new)
    @parser = parser
    @pages = pages
    @unique_pages = unique_pages
    @display = display
  end

  def run
    parser.translate_log_to_array
    display.create(pages.order(parser.logs))
    display.create_unique(unique_pages.order(parser.logs))
  end

end
