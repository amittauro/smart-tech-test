require_relative 'parser'
require_relative 'calculator'
require_relative 'report'

class PageViewsApp
  attr_reader :server_log, :parser, :calculator, :report, :logs

  def initialize(server_log, parser = Parser.new, calculator = Calculator.new, report = Report.new)
    @server_log = server_log
    @parser = parser
    @calculator = calculator
    @report = report
  end

  def transform_data
    @logs = parser.transform_data(server_log)
  end

  def calculate_page_views
    calculator.get_page_views(logs)
  end

  def calculate_unique_page_views
    calculator.get_unique_page_views(logs)
  end

  def create_report
    report.create(logs)
  end

end
