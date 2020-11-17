require_relative 'pages'
require_relative 'log'
require_relative 'unique_pages'

class Parser

  attr_reader :server_log, :logs, :log

  def initialize(server_log, log = Log)
    @server_log = File.open("#{Dir.pwd}/#{server_log}", 'r')
    @log = log
    @logs = []
  end

  def translate_log_to_array
    server_log.each do |line|
      logs.push(log.new(get_page(line), get_IP(line)))
    end
    logs
  end

  private

  def get_page(line)
    line.split(' ')[0]
  end

  def get_IP(line)
    line.split(' ')[1]
  end

end
