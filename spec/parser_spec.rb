require 'parser'

describe Parser do
  describe 'translate_log_to_hash' do
    context 'when transform data' do
      it 'returns a hash of the route and its IP address' do
        parser = Parser.new('mocks/mock_log.txt')
        expect(parser.translate_log_to_hash).to eq({'route1' => 'IP1', 'route2' => 'IP2'})
      end
    end
  end
end
