class CreateLessonWords < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_words do |t|
      t.integer :lesson_id
      t.interger :word_id
      t.integer :word_answer_id
      t.datetime :created_at
      t.datetime :updated_ad

      t.timestamps
    end
  end
end
