require 'pages'

describe Pages do
  let(:page_views) { Pages.new }
  describe '#count' do
    context 'when getting the number of views per page' do
      it 'returns a hash of the page with its number of views' do
        log1 = double('log1')
        allow(log1).to receive(:page) { 'page1' }
        log2 = double('log2')
        allow(log2).to receive(:page) { 'page1' }
        mocklogs = [log1, log2]
        expect(log1).to receive(:update_page_views).with(2)
        expect(log2).to receive(:update_page_views).with(2)
        page_views.count(mocklogs)
      end
    end
  end

  describe '#order' do
    context 'when ordering the page views count' do
      it 'expects page_views to run its count method' do
        log1 = double('log1')
        allow(log1).to receive(:page) { 'page1' }
        log2 = double('log2')
        allow(log2).to receive(:page) { 'page1' }
        mocklogs = [log1, log2]
        expect(page_views).to receive(:count).with(mocklogs)
        page_views.order(mocklogs)
      end

      it 'returns an ordered hash of pages with their views' do
        log1 = double('log1')
        allow(log1).to receive(:page) {'page1'}
        allow(log1).to receive(:update_page_views).with(3)
        allow(log1).to receive(:page_views) { 3 }
        log2 = double('log2')
        allow(log2).to receive(:page) {'page2'}
        allow(log2).to receive(:update_page_views).with(2)
        allow(log2).to receive(:page_views) { 2 }
        mocklogs = [log1, log2, log1, log1, log2]
        expect(page_views.order(mocklogs)).to eq([log1, log2])
      end
    end
  end
end
