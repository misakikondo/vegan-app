class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :donates
  has_many :comments
  has_many   :likes
  has_many   :liked_recipes, through: :likes, source: :recipe


  validates :email, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i },
                       length: { minimum: 6 }

  validates :nickname, presence: true

  validates :birth, presence: true

  def already_liked?(recipe)
    self.likes.exists?(recipe_id: recipe.id)
  end
end
