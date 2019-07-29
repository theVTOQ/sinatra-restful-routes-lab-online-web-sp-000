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

  post "/recipes" do
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save

    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/new" do
    erb :new
  end
  
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name] if !!params[:name]
    @recipe.ingredients = params[:ingredients] if !!params[:ingredients]
    @recipe.cook_time = params[:cook_time] if !!params[:cook_time]

    redirect "recipes/#{params[:id]}"
  end
end
