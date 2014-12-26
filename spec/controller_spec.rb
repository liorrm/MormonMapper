require_relative 'spec_helper.rb'

temples = Temple.all

temples.each do |temple|
  p temple
end

describe "index controller" do

  before do
    @temples = Temple.all
  end

  describe "GET /" do
    it "exists and responds with an OK status" do
      get '/'
      expect(last_response).to be_ok
    end

  end

end