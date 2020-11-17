require 'page_views_app'

describe 'feature test' do
  it 'can run the app' do
    expect { PageViewsApp.new(Parser.new('server_log.txt')).run }.to output('foo').to_stdout
  end
end
