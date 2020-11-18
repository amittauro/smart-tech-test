require 'report'

describe Report do
  describe '#create' do
    context 'when viewing the pages with their order' do
      it 'returns a string of ordered pages' do
        report = Report.new
        log1 = double('log', page: 'page1', page_views: 2, unique_page_views: 1)
        log2 = double('log', page: 'page2', page_views: 3, unique_page_views: 2)
        mocklogs = [log2, log1]
        expect { report.create(mocklogs) }.to output([
          'page2 3 visits',
          'page1 2 visits',
          'page2 2 unique views',
          'page1 1 unique views'
        ].join("\n") + ("\n")).to_stdout
      end
    end
  end
end
