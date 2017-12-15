require('spec_helper')

describe(ShoeStore) do
  it("has many brands") do
    test_brand1 = ShoeBrand.create({:name => "brand1"})
    test_brand2 = ShoeBrand.create({:name => "brand2"})
    test_store = ShoeStore.create({:name => "store", :shoe_brand_ids => [test_brand1.id, test_brand2.id]})
    expect(test_store.shoe_brands).to(eq([test_brand1, test_brand2]))
  end
end
