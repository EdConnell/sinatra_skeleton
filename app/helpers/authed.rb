def authed?
  if session[:user_id]
    true
  else
    redirect '/login'
  end
end
