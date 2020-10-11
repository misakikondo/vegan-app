class LikesController < ApplicationController
  before_action :recipe_params

  def create
    @like = current_user.likes.create(recipe_id: params[:id])
  end

  def destroy
    Like.find_by(recipe_id: params[:id], user_id: current_user.id).destroy
  end

  private

  def recipe_params
    @recipe = Recipe.find(params[:id])
  end
end
