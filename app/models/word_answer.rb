# == Schema Information
#
# Table name: word_answers
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  correct    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  word_id    :integer
#
class WordAnswer < ApplicationRecord
  belongs_to :word

	rails_admin do
	    nested do
	      	configure :product do
	        	hide
	      	end
	    end
	end
end
