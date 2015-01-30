helpers do
  def current_user
    return User.find(session[:user_id]) if session[:user_id]
    nil
  end

end