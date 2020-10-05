class Recipe < ApplicationRecord
  belongs_to :levels
  belongs_to :cookingtimes
  belongs_to :user
  has_many   :comments

  with_options presence: true do
    validates :level_id,  numericality: { other_than: 1, message: 'Select' }
    validates :cookingtime_id,  numericality: { other_than: 1, message: 'Select' }

  end
end
