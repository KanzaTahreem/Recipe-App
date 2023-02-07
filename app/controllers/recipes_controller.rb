class RecipesController < ApplicationController
  before_action :find_user, expect: [:update]

  
  def index
    @recipes = @user.recipes.all
  end

  def show
    @recipe = @user.recipes.find(params[:id])  
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = @user

    if @recipe.save
      redirect_to recipe_path(id: @recipe.id), notice: 'Recipe created successfully'
    else
      flash.now[:alert] = @recipe.errors.full_messages.first if @recipe.errors.any?
      render :new, status: 400
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was deleted successfully'
    else
      flash.now[:alert] = @recipe.errors.full_messages.first if @recipe.errors.any?
      render :index, status: 400
    end
  end

  private

  def find_user
    @user = current_user
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
