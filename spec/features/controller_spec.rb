require_relative '../spec_helper'


describe "index controller" do

  before :each do
    @temples = Temple.all
  end

  describe "GET /" do
    it "exists and responds with an OK status" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end

feature 'LDS enthusiast visits the page' do

  scenario 'all temples are listed in sidebar' do
    visit '/'
    expect(page).to have_content('Aba Nigeria Temple')
    expect(page).to have_content('Winter Quarters Nebraska Temple')
    expect(page).to have_css('div.item', count: 170)
  end

  scenario 'map is loaded from mapbox' do
    visit '/'
    expect(page).to have_css('img.leaflet-tile')
  end

end