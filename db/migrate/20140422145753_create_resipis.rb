class CreateResipis < ActiveRecord::Migration
  def change
    create_table :resipis do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
