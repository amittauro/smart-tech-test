require_relative 'page_views'
require_relative 'unique_page_views'

class Parser

  attr_reader :server_log, :logs

  def initialize(server_log)
    @server_log = File.open("#{Dir.pwd}/#{server_log}", 'r')
    @logs = []
  end

  def translate_log_to_hash
    server_log.each do |log|
      logs.push([get_page(log), get_IP(log)])
    end
    logs
  end

  private

  def get_page(log)
    log.split(' ')[0]
  end

  def get_IP(log)
    log.split(' ')[1]
  end

end
