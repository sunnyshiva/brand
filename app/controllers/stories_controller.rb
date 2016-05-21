class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		@stories = Story.all.order("created_at DESC")
	end

	def show
	end

	def new
		@story = current_user.story.build
	end

	def create
		@story = current_user.story.build(story_params)

		if @story.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @story.update(story_params)
			redirect_to story_path(@story)
		else
			render 'edit'
		end
	end

	def destroy
		@story.destroy
		redirect_to root_path
	end

	private

	def story_params
		params.require(:story).permit(:title, :description, :creator)
	end

	def find_story
		@story = Story.find(params[:id])
	end

end
