class CreateResipis < ActiveRecord::Migration
  def change
    create_table :resipis do |t|
    	t.integer :user_id
      t.string :title
      t.text :text
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
    add_index :resipis, [:user_id, :created_at]
  end
end
