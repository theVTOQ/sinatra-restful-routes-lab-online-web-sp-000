class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipes" do
    @recipes = Recipe.all

    erb :recipes
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end

  get "/recipes/:id/edit" do
    erb :edit
  end

  post "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name] if !!params[:name]
    @recipe.ingredients = params[:ingredients] if !!params[:ingredients]
    @recipe.cook_time = params[:cook_time] if !!params[:cook_time]

    erb :recipe
  end
end
