# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  mount_uploader :photo, CategoryUploader
  has_many :words
end
