class AddPostsCountToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :posts_count, :integer, dafault: 0
  end
end
