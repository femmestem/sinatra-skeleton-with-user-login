get '/' do
  erb :login
end

get '/user/new' do
  erb :new_user
end

# post routes should always redirect to a get route
# do not display views in a post route

# See the Post/Redirect/Get Design Pattern wiki for more info
# http://en.wikipedia.org/wiki/Post/Redirect/Get
post '/login' do
  # returns either a user object from the database or `nil`
  user = User.authenticate(email: params[:email], password: params[:password])

  if user
    session[:user_id] = user.id
    redirect to "/user/#{user.id}"
  else
    redirect to '/'
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
    erb :owner_profile
  elsif @user
    erb :user_profile
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
  session[:user_id] = nil
  redirect to '/'
end

# for development debugging only
get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
