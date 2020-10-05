class Recipe < ApplicationRecord
  has_one :level
  has_one :time
  belongs_to :user
  has_many :comments

end
