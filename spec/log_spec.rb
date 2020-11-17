require 'log'

describe Log do
  describe '#reader_methods' do
    context 'when using the logs class' do
      it 'returns its page' do
        log = Log.new('page', 'ip')
        expect(log.page).to eq('page')
      end

      it 'returns its ip' do
        log = Log.new('page', 'ip')
        expect(log.ip).to eq('ip')
      end

      it 'returns its page views' do
        log = Log.new('page', 'ip')
        expect(log.page_views).to eq(nil)
      end
    end
  end

  describe '#update_page_views' do
    context 'when getting the page views' do
      it 'returns the pages views' do
        log = Log.new('page', 'ip')
        expect(log.update_page_views(2)).to eq(2)
      end
    end
  end
end
