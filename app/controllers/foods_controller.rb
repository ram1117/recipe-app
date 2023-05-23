class FoodsController < ApplicationController
  # before_action :set_recipe, only: %i[show edit update destroy]
  # before_action :authenticate_user!

  # after implementing devise we have to change User.first.id to current_user.id.

  def index
    @all_foods = Food.where(user_id: User.first.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = User.first.id

    if @food.save
      redirect_to user_foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to user_foods_path, notice: "#{@food.name} was successfully deleted"
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
