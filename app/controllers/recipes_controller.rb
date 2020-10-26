class RecipesController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :show]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :search_recipe, only: [:index, :search]

  def index
    @recipes = Recipe.all.order('created_at DESC')
    set_level_column
    set_cookingtime_column
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
    render :show if @recipe.user != current_user
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to recipes_path
    else
      render :show
    end
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
    @like = Like.new
  end

  def search
    @results = @r.result.includes(:level).order('created_at DESC')
    @results = @r.result.includes(:cookingtime).order('created_at DESC')
  end

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

  def search_recipe
    @r = Recipe.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_level_column
    @level_name = Level.select('name').distinct
  end

  def set_cookingtime_column
    @cookingtime_name = Cookingtime.select('name').distinct
  end
end
