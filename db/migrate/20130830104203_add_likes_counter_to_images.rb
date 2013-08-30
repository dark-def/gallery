class AddLikesCounterToImages < ActiveRecord::Migration
  def change
    add_column :images, :likes_count, :integer, :default => 0

    Image.reset_column_information
    Image.all.each do |p|
      Image.update_counters p.id, :likes_count => p.likes.length
    end
  end
end
