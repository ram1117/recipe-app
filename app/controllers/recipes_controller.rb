class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def new
    @user = current_user
  end

  def create
    recipe = Recipe.new(
      name: recipe_params['name'],
      preparation_time: recipe_params['preparation_time'],
      cooking_time: recipe_params['cooking_time'],
      description: recipe_params['description'],
      public: recipe_params['public'],
      user_id: current_user.id
    )
    if recipe.save
      flash[:success] = 'recipe created successfully'
      redirect_to user_recipes_path(user_id: current_user.id)
    else
      flash[:alert] = 'error creating recipe'
    end
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

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

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
