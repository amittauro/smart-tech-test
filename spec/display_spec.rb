require 'display'

describe Display do
  describe '#create' do
    context 'when viewing the pages with their order' do
      it 'returns a string of ordered pages' do
        display = Display.new
        log1 = double('log', page: 'page1', page_views: 2)
        log2 = double('log', page: 'page2', page_views: 3)
        mocklogs = [log2, log1]
        expect(display.create(mocklogs)).to eq(['page2 3 visits', 'page1 2 visits'].join("\n"))
      end
    end
  end
end
