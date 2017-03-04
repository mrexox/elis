class AccessController < ApplicationController
	layout :resolve_layout
  before_action :check_logged_in, :except => [:login, :attempt_login, :logout]
  def console
    # displays menu and admin console
  end

  def login
    # displays login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      user = AdminUser.where(:username => params[:username]).first
      if user
        authorized_user = user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash.now[:notice] = 'U have loggen in'
      redirect_to(admin_path)
    else
      flash.now[:error] = 'Invalid username/password'
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'U have logged out'
    redirect_to(root_path)
  end

	private
	def resolve_layout
		case action_name
		when 'login'
			'application'
		else
			'admin'
		end
	end
end
