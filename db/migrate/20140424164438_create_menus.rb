class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :user_id
      t.string :title
      t.text :ingredient
      t.text :description
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
    add_index :menus, [:user_id, :created_at]
  end
end
