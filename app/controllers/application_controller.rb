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
    erb :recipe
  end

  get "/recipes/:id/edit" do
    erb :edit
  end

  post "/recipes/:id/edit" do

  end
end
