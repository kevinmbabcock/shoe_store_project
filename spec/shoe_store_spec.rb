require('spec_helper')

describe(ShoeStore) do
  it("has many brands") do
    test_brand1 = ShoeBrand.create({:name => "brand1"})
    test_brand2 = ShoeBrand.create({:name => "brand2"})
    test_store = ShoeStore.create({:name => "store", :shoe_brand_ids => [test_brand1.id, test_brand2.id]})
    expect(test_store.shoe_brands).to(eq([test_brand1, test_brand2]))
  end

  it("validates the presence of a name") do
    test_store = ShoeStore.new({:name => ""})
    expect(test_store.save).to(eq(false))
  end

  it("validates the presence of a name") do
    test_store1 = ShoeStore.create({:name => "seattle"})
    test_store2 = ShoeStore.create({:name => "seattle"})
    expect(test_store2.save).to(eq(false))
  end

  it("validates the name is not more than 100 characters") do
    test_store = ShoeStore.create({:name => "a"*101})
    expect(test_store.save).to(eq(false))
  end

  describe("#capitalize_name") do
    it("capitalizes the name of the store before saving it to database") do
      test_store = ShoeStore.create({:name => "seattle"})
      expect(test_store.name).to(eq("Seattle"))
    end
  end
end
