require 'rails_helper'

RSpec.describe 'Default and Location search request', type: :request do
  it 'returns html at the root' do
    get '/'
    expect(response).to be_successful
    expect(response.content_type).to eq('text/html; charset=utf-8')
  end

  it 'returns html when searched' do
    get '/?location=padova'
    expect(response).to be_successful
    expect(response.content_type).to eq('text/html; charset=utf-8')
  end
end
