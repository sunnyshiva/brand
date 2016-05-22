class ReviewsController < ApplicationController
	before_action :find_story

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.story_id = @story.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to story_path(@story)
		else
			render 'new'
		end
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_story
			@story = Story.find(params[:story_id])
		end

end
