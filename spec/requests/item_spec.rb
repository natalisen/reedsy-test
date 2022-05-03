require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /items" do
    
    before do
      mug = Item.create(code: 'item1', name: 'Reedsy Mug', price: 6.00)
      shirt = Item.create(code: 'item2', name: 'Reedsy T-shirt', price: 15.00)
      hoodie = Item.create(code: 'item3', name: 'Reedsy Hoodie', price: 20.00)
      get "/items"
    end

    it 'returns all items' do
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do   
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /items" do
    
    before do
      mug = Item.create(code: 'item1', name: 'Reedsy Mug', price: 6.00)
      patch "/items/#{mug.id}", params: { item: { price: 7.00} }
    end

    it 'returns updated price' do
      expect(json['price']).to eq("7.0")
    end

    it 'returns status code 200' do   
      expect(response).to have_http_status(:success)
    end
  end

end
