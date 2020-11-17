require 'page_views_app'

describe PageViewsApp do
  describe '#run' do
    context 'when running the app' do
      it 'asks the parser class to translate log to hash' do
        parser = double('parser')
        allow(parser).to receive(:hash_of_logs)
        expect(parser).to receive(:translate_log_to_hash)
        PageViewsApp.new(parser).run
      end


      it 'asks unique page view and page views to order the hash' do
        page_views = double('page_views')
        unique_page_views = double('unique_page_views')
        parser = double('parser')
        allow(parser).to receive(:translate_log_to_hash)
        allow(parser).to receive(:hash_of_logs) { {'route1' => 'IP1', 'route2' => 'IP2'} }
        expect(page_views).to receive(:order).with(parser.hash_of_logs)
        expect(unique_page_views).to receive(:order).with(parser.hash_of_logs)
        PageViewsApp.new(parser, page_views, unique_page_views).run
      end
    end
  end
end
