class Comment < ApplicationRecord
  belongs_to :recipe, dependent: :destroy
  belongs_to :user,   dependent: :destroy

  validates :contents, presence: true, length: { maximum: 100 }
end
