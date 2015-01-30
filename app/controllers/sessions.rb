post '/login' do
  user = User.authenticate(email: params[:email], password: params[:password])

  if user
    session[:user_id] = user.id
    redirect to "users/#{current_user.id}"
  else
    redirect to home_url # see app/helpers/
  end
end

post '/logout' do
  session[:user_id] = nil
  @user = nil

  redirect to home_url # see app/helpers/
end