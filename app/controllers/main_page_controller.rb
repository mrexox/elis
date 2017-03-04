class MainPageController < ApplicationController

  layout 'application'

  def home
    @slides = SliderItem.sorted
    @posts = Post.sorted.limit(3)
  end

  def blog
    page = params[:page].blank? ? 1 : params[:page].to_i
    page -= 1
    @posts = Post.sorted.offset(page*3).limit(3)
    @posts_number = Post.count
    @current_page = page + 1
  end

  def show_post
    @post = Post.where(:permalink => params[:permalink]).first
  end

  def shop
  end
	def contact_me
    @message = Message.new
	end
end
