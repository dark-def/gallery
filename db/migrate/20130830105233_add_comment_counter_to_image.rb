class AddCommentCounterToImage < ActiveRecord::Migration
  def change
    add_column :images, :comments_count, :integer, :default => 0

    Image.reset_column_information
    Image.all.each do |p|
      Image.update_counters p.id, :comments_count => p.comments.length
    end
  end
end
