class TagsController < ApplicationController
	layout 'admin'
	before_action :check_logged_in

	def index
		@tags = Tag.sorted
		@counts = {}
		@tags.each do |tag|
			@counts[tag.id] = tag.posts.count
		end
	end

	def update
		tag = Tag.find(params[:id])
		if tag.update_attributes(tag_params)
			flash[:notice] = "Тэг '#{tag.tag_name}' был переименован во всех постах"
		else
			flash[:notice] = "Кажется, этот тэг уже существует..." if !tag.tag_name.empty?
		end
		retirect_to(tags_path)
	end

	def create
		tag = Tag.new(tag_params)
		if tag.save
			flash[:notice] = "Был добавлен новый тэг '#{tag.tag_name}'"
		else
			flash[:notice] = "Кажется, тэг '#{tag.tag_name}' уже существует..." if !tag.tag_name.empty?
		end
		redirect_to(tags_path)
	end

	def destroy
		tag = Tag.find(params[:id])
		if tag.destroy
			flash[:notice] = "Тэг '#{tag.tag_name}' был удалён из всех постов."
		else
			flash[:notice] = "Опа! Тэг '#{tag.tag_name}' нельзя удалить. Звони программисту, что-то пошло не так."
		end
		redirect_to(tags_path)
	end

	private

	def tag_params
		params.require(:tag).permit(:tag_name)
	end
end
