class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :prefecture
      t.string :city
      t.string :classification
      t.string :status
      t.string :user_id

      t.timestamps
    end
  end
end
