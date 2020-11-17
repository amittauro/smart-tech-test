require 'pry'

class Parser

  attr_reader :server_log, :hash_of_logs

  def initialize(server_log)
    @server_log = File.open("#{Dir.pwd}/#{server_log}", 'r')
    @hash_of_logs = {}
  end

  def translate_log_to_hash
    server_log.each do |log|
      hash_of_logs[get_route(log)] = get_IP(log)
    end
    hash_of_logs
  end

  private

  def get_route(log)
    log.split(' ')[0]
  end

  def get_IP(log)
    log.split(' ')[1]
  end

end
