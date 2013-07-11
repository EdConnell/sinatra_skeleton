get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(params[:user])

  p @user
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :error
  end
end

get '/login' do
  erb :login
end

post '/login' do
  p params.inspect
  @user = User.find_by_email(params[:user][:email])
  if @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect('/')
  else
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end
