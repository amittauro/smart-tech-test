require 'unique_pages'

describe UniquePages do
  describe '#order' do
    context 'when ordering a list of logs for unique pages by views' do
      it 'returns an array or ordered logs' do
        unique_pages = UniquePages.new
        log1 = double('log', page: 'page1', ip: 'IP1', unique_page_views: 1)
        log2 = double('log', page: 'page2', ip: 'IP2', unique_page_views: 1)
        log3 = double('log', page: 'page1', ip: 'IP1', unique_page_views: 1)
        allow(log1).to receive(:update_unique_page_views)
        allow(log2).to receive(:update_unique_page_views)
        allow(log3).to receive(:update_unique_page_views)
        mocklogs = [log1, log2, log3]
        expect(unique_pages.order(mocklogs)).to eq([log1, log2])
      end
    end
  end
end
