get '/files' do
  authed?
  @user = User.find(session[:user_id])
  p "========= USER: ==========="
  p session[:user_id]
  p @user.inspect
  p "===================="  
  erb :files
end


post '/files' do
  p "========= PARAMS: ==========="
  p params.inspect
  p "===================="
  @user = User.find(session[:user_id])
  file = @user.user_files.create(title: params[:userfile][:title],
                                 file: "uploads/#{params[:userfile][:title] + params[:userfile][:file][:filename].match(/.*(\.\w{3,4})/)[1]}"
                                )
  UserFile.fuck_with_image(file.title)
  redirect '/files'
end
