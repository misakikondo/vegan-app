class CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@comment.recipe.id)
    else
      render template: "recipes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:contents).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
