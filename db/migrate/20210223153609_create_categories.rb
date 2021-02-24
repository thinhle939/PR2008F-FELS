class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :creatad_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
