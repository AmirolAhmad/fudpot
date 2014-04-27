class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.integer :level_id
      t.integer :category_id
      t.string :title
      t.text :ingredient
      t.text :description
      t.string :filename
      t.string :mime_type
      t.text :preparation
      t.string :serve
      t.string :cooking_time

      t.timestamps
    end
    add_index :menus, [:user_id, :created_at]
    add_index :menus, [:level_id]
    add_index :menus, [:category_id]
  end
end
