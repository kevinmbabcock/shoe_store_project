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
