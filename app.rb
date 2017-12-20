require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/brands") do
  @brands = ShoeBrand.all
  erb(:brands)
end

get("/stores") do
  @stores = ShoeStore.all
  erb(:stores)
end

get("/brands/:id") do
  @brand = ShoeBrand.find(params[:id].to_i)
  @stores = ShoeStore.all
  erb(:brand)
end

get("/stores/:id") do
  @store = ShoeStore.find(params[:id].to_i)
  @brands = ShoeBrand.all
  erb(:store)
end

get("/admin") do
  erb(:admin)
end

get("/admin/add-store") do
  erb(:add_store)
end

get("/admin/add-brand") do
  erb(:add_brand)
end

post("/add-brand") do
  name = params[:brand_name]
  price = params[:brand_price].to_f
  ShoeBrand.create({:name => name, :price => price})
  erb(:admin)
end

post("/add-store") do
  name = params[:store_name]
  ShoeStore.create({:name => name})
  erb(:admin)
end

get("/stores/store/:id/edit") do
  @store = ShoeStore.find(params[:id].to_i)
  @brands = ShoeBrand.all
  erb(:edit_store)
end

get("/brands/brand/:id/edit") do
  @brand = ShoeBrand.find(params[:id].to_i)
  erb(:edit_brand)
end

patch("/stores/:id") do
  @store = ShoeStore.find(params[:id].to_i)
  brand_ids = params[:brand_ids]
  current_ids = @store.shoe_brand_ids
  current_ids.each do |id|
    brand_ids.push(id)
  end
  @store.update({:shoe_brand_ids => brand_ids})
  @brands = ShoeBrand.all
  erb(:store)
end

patch("/brands/:id") do
  @brand = ShoeBrand.find(params[:id].to_i)
  store_ids = params[:store_ids]
  current_ids = @brand.shoe_store_ids
  current_ids.each do |id|
    store_ids.push(id)
  end
  @brand.update({:shoe_store_ids => store_ids})
  @stores = ShoeStore.all
  binding.pry
  erb(:brand)
end

patch("/stores/:id/edit") do
  name = params[:name]
  @store = ShoeStore.find(params[:id].to_i)
  @store.update({:name => name})
  @stores = ShoeStore.all
  erb(:stores)
end

patch("/brands/:id/edit") do
  name = params[:name]
  @brand = ShoeBrand.find(params[:id].to_i)
  @brand.update({:name => name})
  @brands = ShoeBrand.all
  erb(:brands)
end

delete("/stores/:id") do
  @store = ShoeStore.find(params[:id].to_i)
  @store.delete
  @stores = ShoeStore.all
  erb(:stores)
end

delete("/brands/:id") do
  @brand = ShoeBrand.find(params[:id].to_i)
  @brand.delete
  @brands = ShoeBrand.all
  erb(:brands)
end
