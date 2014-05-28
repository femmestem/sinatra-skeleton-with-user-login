helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def error_nullifier 
    session[:error] = nil
  end

  def error
    { incorrect: "Incorrect email or password", user_exists: "User already exists, please log in." }
  end

end