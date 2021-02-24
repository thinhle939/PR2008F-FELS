class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.text :content
      t.integer :category_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
