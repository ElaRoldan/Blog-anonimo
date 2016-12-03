class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.belongs_to :posts, index: true
      t.belongs_to :tags, index: true
      t.timestamps
    end
  end
end
