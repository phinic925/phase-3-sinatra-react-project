class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/recipes" do

    recipes = Recipe.all
    recipes.to_json
    
  end

  get "/recipes/:id" do

    recipe = Recipe.find(params[:id])

    recipe.to_json(only: [:id, :name, :category, :instructions], include: { reviews: { only: [:description], include: { user: {only: [:name] }
      } } 
      })
  end
  get "/reviews" do

    reviews = Review.all
    reviews.to_json
    
  end

  get "/reviews/:id" do

    review = Review.find(params[:id])

    review.to_json
  end
  get "/users" do

    users = User.all
    users.to_json
    
  end

  get "/users/:id" do

   user = User.find(params[:id])

    user.to_json
  end
  
  delete "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    recipe.to_json
  end
  delete "/reviews/:id" do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end

  post '/recipes' do
    recipe = Recipe.create(
      name: params[:name],
      category: params[:category],
      instructions: params[:instructions],
      image_url: params[:image_url]
    )
    recipe.to_json
  end
  post '/reviews' do
    review = Review.create(
      description: params[:description],
      user_id: params[:user_id],
      recipe_id: params[:recipe_id]
    )
    review.to_json
  end
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(
    instructions: params[:instructions]
   
   )
    recipe.to_json
  end
  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update(
      description: params[:description],
      
    )
    review.to_json
  end
end
