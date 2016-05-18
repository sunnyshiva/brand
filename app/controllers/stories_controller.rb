class StoriesController < ApplicationController

	def index
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(story_params)
	end

	private

	def story_params
		params.require(:story).permit(:title, :description, :creator)
	end
end
