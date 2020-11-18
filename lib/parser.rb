require_relative 'log'

class Parser
  attr_reader :log

  def initialize(log = Log)
    @log = log
  end

  def transform_data(server_log)
    read_file(server_log).readlines.map(&:chomp).map do |line|
      log.new(get_page(line), get_ip(line))
    end
  end

  private

  def read_file(server_log)
    File.open("#{Dir.pwd}/#{server_log}", 'r')
  end

  def get_page(line)
    line.split(' ')[0]
  end

  def get_ip(line)
    line.split(' ')[1]
  end

end
