class AddAttachmentStoryImgToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :story_img
    end
  end

  def self.down
    remove_attachment :stories, :story_img
  end
end
