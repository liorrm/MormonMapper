get '/' do
  @temples = Temple.all
  erb :index
end