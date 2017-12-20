class ShoeBrand < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  validates(:name, :uniqueness => true)
  has_many(:brand_stores)
  has_many(:shoe_stores, through: :brand_stores)
  before_save(:capitalize_name)
  before_save(:price_format)

  private

  def capitalize_name
    self.name = self.name.capitalize
  end

  def price_format

  end

end
