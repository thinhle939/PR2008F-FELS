# == Schema Information
#
# Table name: words
#
#  id          :bigint           not null, primary key
#  content     :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers, dependent: :destroy

  accepts_nested_attributes_for :word_answers, allow_destroy: true, reject_if: :all_blank
end
