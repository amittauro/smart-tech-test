require 'page_views'

describe PageViews do
  let(:page_views) { PageViews.new }
  describe '#count' do
    context 'when getting the number of views per page' do
      it 'returns a hash of the page with its number of views' do
        mocklogs = [['route1', 'IP1'], ['route1', 'IP2']]
        expect(page_views.count(mocklogs)).to eq({'route1' => 2})
      end
    end
  end
end
