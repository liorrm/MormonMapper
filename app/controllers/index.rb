get '/' do
  erb :index
end

get '/test' do
  @temples = Temple.all
  erb :test
end