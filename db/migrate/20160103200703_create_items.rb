class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, id: false do |t|
      t.string :cart_id, null: false
      t.string :item_id, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
