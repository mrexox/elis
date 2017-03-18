class AccessController < ApplicationController
	layout 'admin'
  before_action :check_logged_in, :except => [:login, :attempt_login, :logout]
  def console
    # displays menu and admin console
		@posts_count = Post.all.count
		@messages_count = Message.all.count
		@slider_items_count = SliderItem.all.count
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
      flash[:notice] = 'Рада видеть тебя, Элина!'
      redirect_to(admin_path)
    else
      flash[:error] = 'Пароль или логин введён неверно'
      redirect_to(login_path)
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Приходи ещё!'
    redirect_to(root_path)
  end

end
