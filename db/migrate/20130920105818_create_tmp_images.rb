class CreateTmpImages < ActiveRecord::Migration
  def change
    create_table :tmp_images do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
