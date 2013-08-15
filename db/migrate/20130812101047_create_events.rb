class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :event
      t.string :url

      t.timestamps
    end
  end
end
