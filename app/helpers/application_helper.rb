module ApplicationHelper

  def current_user
    User.find_by_session_token(sesson[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user(user)
    session[:session_token] = user.reset_session_token!
  end
end
