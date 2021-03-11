class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers, dependent: :destroy
  accepts_nested_attributes_for :word_answers, allow_destroy: true,
    reject_if: :all_blank
end
