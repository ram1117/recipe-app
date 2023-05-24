class RecipesController < ApplicationController
  def index
    @user = User.first
    @recipes = Recipe.where(user_id: @user.id)
  end

  def show
    @user = User.first
    # update current user after devise
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
    @recipe_foods = @recipe.recipe_foods
  end

  def update; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(params[:user_id]),
                    notice: 'recipe deleted successfully'
      end
    end
  end
end
