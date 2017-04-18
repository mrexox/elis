# coding: utf-8
class PostsController < ApplicationController
	layout 'admin'

  before_action :check_logged_in

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(parsed_params)
    if @post.save
      flash[:notice] = "Ура! Новый пост: #{@post.name} "
      redirect_to(posts_path)
    else
      flash.now[:notice] = 'Произошла ошибка. Какие-то поля введены неверно'
      render('new')
    end

  end

  def show
    @post = Post.find(params[:id])
  end
  def index
    @posts = Post.sorted
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
		puts "-==================-\n"
		puts parsed_params.to_s, parsed_params[:images].to_s
		puts "-==================-\n"
    if @post.update_attributes(parsed_params)
      flash[:notice] = 'Пост успешно обновлён'
      redirect_to(posts_path)
    else
      flash.now[:notice] = 'Произошла ошибка. Какие-то поля введены неверно'
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Пост '#{@post.name}' был удалён"
    redirect_to(posts_path)
  end
  private

  def post_params
    params.require(:post).permit(:name, :text, :permalink, :tags, {:images => []})
  end

	def parse_tags
		tag_names = post_params[:tags].strip.split(/\s*,\s*/).uniq
		tags = []
		tag_names.each do |tag_name|
			tag = Tag.where(:tag_name => tag_name).first
			if tag.nil?
				tag = Tag.new(:tag_name => tag_name)
				if !tag.save 
					flash[:notice] = "Не получилось сохранить тэг '#{tag_name}'"
				end
			end
			tags << tag
		end
		tags
	end

	def parsed_params
		parameters = post_params
		parameters[:tags] = parse_tags
		parameters
	end

end
