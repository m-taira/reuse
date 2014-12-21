class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :status
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
