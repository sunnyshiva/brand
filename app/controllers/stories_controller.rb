class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@stories = Story.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@stories = Story.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
	end

	def new
		@story = current_user.stories.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@story = current_user.stories.build(story_params)
		@story.category_id = params[:category_id]

		if @story.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@story.category_id = params[:category_id]

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
			params.require(:story).permit(:title, :description, :creator, :category_id)
		end

		def find_story
			@story = Story.find(params[:id])
		end

end
