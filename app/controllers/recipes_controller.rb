class RecipesController < ApplicationController
  before_action :authenticate_user!,  only: :new
  # before_action :search_recipe, only: [:index, :search]


  def index
    @recipes = Recipe.all()
  end

  def new
  end

  def create
  end

  # def search
    # @results = @p.result.includes(:level)
    # @results = @p.result.includes(:cookingtime)
  # end
   # 検索画面実装時に編集


  private

  # def search_recipe
  #   @p = Recipe.ransack(params[:q])  # 検索オブジェクトを生成
  # end
   # 検索画面実装時に編集

end
