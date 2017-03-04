# coding: utf-8
class MessagesController < ApplicationController

	layout 'admin'
  before_action :check_logged_in, :only => [:show, :destroy, :index]
def index
    # Only for admin
    @messages = Message.sorted
end

  def new
    @message = Message.new
end

  def create
    @message = Message.new(message_params)
    if @message.save
      MessageMailer.inform(@message).deliver_now
			flash[:notice] = 'Сообщение отправлено, ждите моего ответа!'
      redirect_to :controller => 'main_page', :action => 'contact_me'
    else
      flash[:notice] = 'Неверно заполнены поля. Попробуйте ещё раз.'
      redirect_to(contacts_path)
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Сообщение '#{@message.theme}' успешно удалено."
    redirect_to(messages_path)
  end

  private

  def message_params
    params.require(:message).permit(:name,
                                    :phone_number,
                                    :email,
                                    :theme,
                                    :text)
  end
end
