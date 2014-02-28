module SessionsHelper
  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    session[:token] = user.session_token
  end

  def sign_out!
    if signed_in?
      current_user.reset_session_token!
      session[:token] = nil
    end
  end
end
