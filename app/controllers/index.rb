get '/' do
  if current_user
    redirect to "/users/#{current_user.id}"
  else
    erb :login
  end
end