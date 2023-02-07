class RecipesController < ApplicationController
  before_action :find_user, expect: [:update]

  
  def index
    @recipes = @user.recipes.all
  end

  def show
    @recipe = @user.recipes.find(params[:id])  
  end

  private

  def find_user
    @user = current_user
  end
end
