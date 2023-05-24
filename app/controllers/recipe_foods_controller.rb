class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @current_user = User.first
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    user = User.first
    recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new({
                                   quantity: recipe_food_params['qty'],
                                   recipe_id: recipe.id,
                                   food_id: recipe_food_params['food_id']
                                 })
    if recipe_food.save
      flash[:success] = 'posted successfully'
    else
      flash[:alert] = 'error creating post'
    end
    redirect_to user_recipe_path(user_id: user.id, id: recipe.id)
  end

  def update; end

  def destroy; end
end

private

def recipe_food_params
  params.require(:new_recipe_food).permit(:food_id, :qty)
end
