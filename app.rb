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
  erb(:brand)
end

get("/stores/:id") do
  @store = ShoeStore.find(params[:id].to_i)
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

get("/store/:id/edit") do
  erb(:edit_store)
end

get("/brand/:id/edit") do
  erb(:edit_brand)
end

patch("/store/:id/edit") do
  name = params[:name]
  @store = ShoeStore.find(params[:id].to_i)
  @store.update({:name => name})
  @stores = ShoeStore.all
  erb(:stores)
end

patch("/brand/:id/edit") do
  name = params[:name]
  @brand = ShoeBrand.find(params[:id].to_i)
  @brand.update({:name => name})
  @brands = Brand.all
  erb(:brands)
end

delete("/stores") do
  @store = Store.find(params[:id].to_i)
  @store.delete
  @stores = Store.all
  erb(:stores)
end

delete("/brands") do
  @brand = Brand.find(params[:id].to_i)
  @brand.delete
  @brands = Brand.all
  erb(:brands)
end
