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
			flash[:notice] = 'Tag was updated'
		else
			flash[:notice] = "Unable to update '#{tag.tag_name}'"
		end
		retirect_to(tags_path)
	end

	def create
		tag = Tag.new(tag_params)
		if tag.save
			flash[:notice] = 'Tagg added'
		else
			flash[:notice] = "Check the tag '#{tag.tag_name}' again"
		end
		redirect_to(tags_path)
	end

	def destroy
		tag = Tag.find(params[:id])
		if tag.destroy
			flash[:notice] = "Tag #{tag.tag_name} was deleted"
		else
			flash[:notice] = "ERROR! Tag #{tag.tag_name} was not deleted"
		end
		redirect_to(tags_path)
	end

	private

	def tag_params
		params.require(:tag).permit(:tag_name)
	end
end
