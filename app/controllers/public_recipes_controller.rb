class PublicRecipesController < ApplicationController
  def index
    @users = User.all
    @public_recipes = Recipe.includes(:recipe_foods).where(public: true).order(created_at: :desc)
  end
end
