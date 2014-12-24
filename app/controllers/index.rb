get '/' do
  @temples = Temple.all
  erb :index
end

get '/test' do
  @temples = Temple.all
  erb :test
end