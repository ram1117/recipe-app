class RecipesController < ApplicationController
  layout 'recipes'
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:user_id], params[:id])
  end

  def update; end

  def destroy
    @recipe = Recipe.find(params[:user_id], params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(params[:user_id]),
                    notice: 'recipe deleted successfully'
      end
    end
  end
end
