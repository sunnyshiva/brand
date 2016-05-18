class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		@stories = Story.all.order("created_at DESC")
	end

	def show
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(story_params)

		if @story.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def story_params
		params.require(:story).permit(:title, :description, :creator)
	end

	def find_story
		@story = Story.find(params[:id])
	end

end
