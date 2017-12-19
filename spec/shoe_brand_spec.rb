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

  it("validates the uniqueness of a name") do
    test_brand1 = ShoeBrand.create({:name => "nike"})
    test_brand2 = ShoeBrand.create({:name => "nike"})
    expect(test_brand2.save).to(eq(false))
  end

  it("validates that the name is not more than 100 characters") do
    test_brand = ShoeBrand.create({:name => "a"*101})
    expect(test_brand.save).to(eq(false))
  end

  describe("#capitalize_name") do
    it("capitalizes the name before saving to database") do
      test_brand = ShoeBrand.create({:name => "nike"})
      expect(test_brand.name).to(eq("Nike"))
    end
  end
end
