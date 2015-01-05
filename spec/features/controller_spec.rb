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