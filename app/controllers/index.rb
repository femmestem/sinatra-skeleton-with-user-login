get '/' do
  error_nullifier 

  erb :index
end

get '/user/new' do
if session[:error] == error[:incorrect]
  error_nullifier
end

  erb :"/users/new_user"
end

post '/user/new' do
  error_nullifier 

  unless User.exists?(email: params[:email])
    user = User.create_with( params[:user] ).find_or_create_by(email: params[:email]) # Overkill but whatever
    session[:user_id] = user.id
    redirect to "/user/#{user.id}"
  else
    session[:error] = error[:user_exists]
    redirect '/user/new'

  end
end

# post routes should always redirect to a get route
# do not display views in a post route

# See the Post/Redirect/Get Design Pattern wiki for more info
# http://en.wikipedia.org/wiki/Post/Redirect/Get

get '/login' do 
  if session[:error] == error[:user_exists]
    error_nullifier
  end


  if current_user 
    redirect '/'
  else
    erb :"/users/login"
  end
end

post '/login' do
  error_nullifier
  # returns either a user object from the database or `nil`
  user = User.authenticate(email: params[:email], password: params[:password])

  if user
    session[:user_id] = user.id
    redirect to "/user/#{user.id}"
  else
    session[:error] = error[:incorrect]
    redirect '/login'
  end
end

# The below are my own hacky routes, do not take them as gospel RESTful routes

# Logged in users can view own profile only
# get '/user/:user_id' do
#   user_id = params[:user_id].to_i
#   if current_user.id == user_id
#     @user = current_user
#     erb :owner_profile
#   elsif current_user
#     redirect to "/user/#{current_user.id}"
#   else
#     redirect to '/'
#   end
# end

# Anyone can view user profiles
# Logged in users can view own profile with additional features

get '/user/:user_id' do
  user_id = params[:user_id]
  @user = User.find(user_id) if User.exists?(user_id)

  if @user == current_user
    erb :"/users/owner_profile"
  elsif @user
    erb :"/users/user_profile"
  elsif current_user
    # erb :profile_does_not_exist
    redirect to '/'
  else
    redirect to '/'
  end
end

# Logged in users can view other users profiles
# Logged in users can view own profile with additional features
# get '/user/:user_id' do
#   user_id = params[:user_id]
#   @user = User.find(user_id) if User.exists?(user_id)

#   if @user && current_user
#     if @user == current_user
#       erb :owner_profile
#     else
#       erb :user_profile
#     end
#   elsif current_user
#     # erb :profile_does_not_exist
#     redirect to '/'
#   else
#     redirect to '/'
#   end
# end

post '/logout' do
  error_nullifier 
  session[:user_id] = nil
  redirect to '/'
end

# for development debugging only
get '/logout' do
  error_nullifier 
  session[:user_id] = nil
  redirect to '/'
end
