class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def check_logged_in
    unless session[:user_id]
      flash[:notice] = 'Прошу, заходите...'
      redirect_to(login_path)
    end
  end
  
end
