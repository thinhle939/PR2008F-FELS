class CreateWordAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :word_answers do |t|
      t.text :content
      t.integer :word_id
      t.integer :correct
      t.datetime :created_ad
      t.datetime :updated_at

      t.timestamps
    end
  end
end
