class AddStoryIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :story_id, :integer
  end
end
