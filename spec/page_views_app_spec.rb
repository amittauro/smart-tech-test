require 'page_views_app'

describe PageViewsApp do
  describe '#run' do
    context 'when running the app' do
      it 'asks the parser class to translate log to hash' do
        parser = double('parser')
        expect(parser).to receive(:translate_log_to_hash)
        PageViewsApp.new(parser).run
      end
    end
  end
end
