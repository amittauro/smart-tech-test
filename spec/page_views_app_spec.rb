require 'page_views_app'

describe PageViewsApp do
  describe '#transformdata' do
    context 'when using the server log' do
      it 'asks the parser class to transfrom the data' do
        parser = double('parser')
        expect(parser).to receive(:transform_data).with('server_log')
        PageViewsApp.new('server_log', parser).transform_data
      end
    end
  end

  describe '#calculate_page_views' do
    context 'when calculating page views' do
      it 'asks the calculator class to calculate page views' do
        parser = double('parser')
        calculator = double('calculator')
        expect(calculator).to receive(:get_page_views)
        PageViewsApp.new('server_log', parser, calculator).calculate_page_views
      end
    end
  end
end
