class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    
    # bakeries = Bakery.all
  
    # bakeries.to_json

    bakeries = Bakery.all
    bakeries.to_json

  end

  get '/bakeries/:id' do
    Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    BakedGood.order(price: :desc).to_json
  end
  get '/baked_goods/most_expensive' do
    BakedGood.order(price: :desc).limit(1)[0].to_json
  end

end