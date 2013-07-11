get '/photos' do
  authed?
  @user = User.find(session[:user_id])
  p "========= USER: ==========="
  p session[:user_id]
  p @user.inspect
  p "===================="  
  erb :photos
end


post '/photos' do
  p "========= PARAMS: ==========="
  p params.inspect
  p "===================="
  Image.create(params[:photo])
  redirect '/photos'
end
