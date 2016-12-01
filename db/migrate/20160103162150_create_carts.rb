class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts, id: false do |t|
      t.string :cart_id, null: false, primary_key: true
      t.datetime :expires_at, null: false
      t.integer :items_count
      t.integer :total

      t.timestamps null: false
    end
  end
end
