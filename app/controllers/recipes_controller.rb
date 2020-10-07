class RecipesController < ApplicationController
  before_action :authenticate_user!,  only: :new
  before_action :find_recipe, only: [:show, :edit, :update]
  # before_action :search_recipe, only: [:index, :search]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    if @recipe.user != current_user
      render :show 
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end

  # def destroy
  #   if @recipe.destroy
  #     redirect_to recipes_path
  #   else
  #     render :show
  #   end
  # end

  # def search
  # @results = @p.result.includes(:level)
  # @results = @p.result.includes(:cookingtime)
  # end
  # 検索画面実装時に編集

  private

  def recipe_params
    params.require(:recipe).permit(
      :image, :recipes_name, :explains,
      :level_id, :cookingtime_id
    ).merge(user_id: current_user.id)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  # def search_recipe
  #   @p = Recipe.ransack(params[:q])  # 検索オブジェクトを生成
  # end
  # 検索画面実装時に編集
end
