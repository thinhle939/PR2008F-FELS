# == Schema Information
#
# Table name: lesson_words
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lesson_id      :integer
#  word_answer_id :integer
#  word_id        :integer
#
class LessonWord < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :word_answer, optional:true
end
