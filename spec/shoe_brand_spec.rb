require('spec_helper')

describe(ShoeBrand) do
  it("has many stores") do
    test_store1 = ShoeStore.create({:name => "store1"})
    test_store2 = ShoeStore.create({:name => "store2"})
    test_brand = ShoeBrand.create({:name => "brand", :price => "50", :shoe_store_ids => [test_store1.id, test_store2.id]})
    expect(test_brand.shoe_stores).to(eq([test_store1, test_store2]))
  end

  it("validates the presence of a name") do
    test_brand = ShoeBrand.create({:name => ""})
    expect(test_brand.save).to(eq(false))
  end
end
