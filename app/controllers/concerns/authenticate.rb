module Authenticate
  extend ActiveSupport::Concern

  def login_required
    @current_user = current_user
    unless @current_user
      redirect_to root_path
    end
  end

  private

  def logged_in?
    !!current_user
  end

  def current_user
    # SessionUserクラスからユーザ情報を取得するように
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end