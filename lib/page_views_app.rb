class PageViewsApp

  attr_reader :parser

  def initialize(parser)
    @parser = parser
  end

  def run
    parser.translate_log_to_hash
  end
  
end
