class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.text :ingredient
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :menus, [:user_id, :created_at]
  end
end
