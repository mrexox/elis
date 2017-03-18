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
		@tags = Tag.sorted
  end

  def shop
  end

	def contact_me
    @message = Message.new
	end

	def about
	end

	def portfolio
	end

	def login
	end

	def search
		@tag_name = params[:tag]
		tag = Tag.find_by(:tag_name => @tag_name)
		if tag.blank?
			@posts_found = false
		else
			@posts = tag.posts
			if @posts.blank?
				@posts_found = false
			else
				@posts_found = true
			end
		end
	end
end
