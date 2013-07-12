get '/' do
  authed?
  erb :index
end



