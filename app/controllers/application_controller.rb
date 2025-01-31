class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/bakeries' do
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
  # add routes
  get '/bakeries/:id' do
    # look up the game in the database using its ID
    bake = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    bake.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 
     baked_goods=BakedGood.by_price
     baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do 
 baked_goods=BakedGood.by_price.first
 baked_goods.to_json
  end
end
