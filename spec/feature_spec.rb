require 'page_views_app'

describe 'feature test' do
  it 'can run the app' do
    pageviewsapp = PageViewsApp.new('test.txt')
    pageviewsapp.transform_data
    pageviewsapp.calculate_page_views
    pageviewsapp.calculate_unique_page_views
    expect { pageviewsapp.create_report }.to output([
      'page1 5 visits',
      'page2 3 visits',
      'page3 2 visits',
      'page1 3 unique views',
      'page2 2 unique views',
      'page3 1 unique views'
    ].join("\n") + "\n").to_stdout
  end
end
