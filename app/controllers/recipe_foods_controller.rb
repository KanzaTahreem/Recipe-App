class RecipeFoodsController < ApplicationController
  before_action :find_recipe
  before_action :find_user
  before_action :find_food

  def index
    @foods = Food.all
    @recipe_foods = RecipeFood.all
  end

  def show
    @recipe_food = @recipe.recipe_foods
  end

  def new
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Food created successfully'
    else
      flash.now[:alert] = @recipe_food.errors.full_messages.first if @recipe_food.errors.any?
      render :new, status: 400
    end
  end
  
  
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.destroy
      redirect_to recipe_path(@recipe), notice: 'Recipe Food was deleted successfully'
    else
      flash.now[:alert] = @recipe_food.errors.full_messages.first if @recipe_food.errors.any?
      render :new, status: 400
    end
  end

  private

  def find_user
    @user = current_user
  end

  def find_recipe
    @recipe = Recipe.find_by_id(params[:recipe_id])
  end

  def find_food
    @food = Food.find_by_id(params[:food_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
