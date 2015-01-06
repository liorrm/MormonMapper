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

  scenario 'first temple is listed in sidebar' do
    visit '/'
    expect(page).to have_content('Aba Nigeria Temple')
  end

  scenario 'last temple is listed in sidebar' do
    visit '/'
    expect(page).to have_content('Winter Quarters Nebraska Temple')
  end

  scenario 'all temples are listed in sidebar' do
    visit '/'
    expect(page).to have_css('div.item', count: 170)
  end

  scenario 'map is loaded from mapbox' do
    visit '/'
    expect(page).to have_css('img.leaflet-tile')
  end
end

feature 'LDS enthusiast clicks on a sidebar item' do

  scenario 'div height expands to show View Gallery link' do
    visit '/'
    first('.title').click
    expect(page).to have_content('View Gallery')
  end

  scenario 'div height expands to show announcement info' do
    visit '/'
    first('.title').click
    expect(page).to have_content('Announcement')
  end

  scenario 'Flickr photos are loaded on div click' do
    visit '/'
    first('.title').click
    sleep(1.5)
    html = page.evaluate_script("document.getElementsByClassName('active')[0].innerHTML")
    html.should include('<a class="photo"')
  end



end

