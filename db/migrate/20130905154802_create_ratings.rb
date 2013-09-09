class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :image_id
      t.integer :user_id
      t.integer :mark

      t.timestamps
    end
  end
end
