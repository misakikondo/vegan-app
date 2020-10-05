class Recipe < ApplicationRecord
  belongs_to :level
  belongs_to :cookingtime
  belongs_to :user
  has_many   :comments
  has_one_attached :image

  with_options presence: true do
    validates :level_id
    validates :cookingtime_id
    validates :recipes_name, length: { maximum: 40 }
    validates :explains, length: { maximum: 1000 }
    validates :image
  end
end
