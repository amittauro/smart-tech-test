require 'parser'

class Mocklog
  def initialize(page, ip)
    @page = page
    @ip = ip
  end
end

describe Parser do
  describe '#transform data' do
    context 'when transforming data from a server log' do
      it 'creates an array with instances of the log class' do
        parser = Parser.new(Mocklog)
        result = parser.transform_data('mocks/mock_log.txt')
        expect(result).to all(be_an_instance_of(Mocklog))
        expect(result.size).to eq(2)
      end
    end
  end
end

# 
#
#
#
#
#
#
#   describe '#translate_log_to_hash' do
#     context 'when transform data' do
#       it 'creates new instances of the log class' do
#         log = double('log')
#         parser = Parser.new('mocks/mock_log.txt', log)
#         expect(log).to receive(:new).with('route1', 'IP1')
#         expect(log).to receive(:new).with('route2', 'IP2')
#         parser.translate_log_to_array
#         # expect(parser.translate_log_to_array).to eq([['route1', 'IP1'], ['route2', 'IP2']])
#       end
#
#       it 'returns an array of log instances' do
#         log = double('log')
#         allow(log).to receive(:new).with('route1', 'IP1') {'log1'}
#         allow(log).to receive(:new).with('route2', 'IP2') {'log2'}
#         parser = Parser.new('mocks/mock_log.txt', log)
#         expect(parser.translate_log_to_array).to eq(['log1', 'log2'])
#       end
#     end
#   end
# end
