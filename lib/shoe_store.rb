class ShoeStore < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  validates(:name, :uniqueness => true)
  has_many(:brand_stores)
  has_many(:shoe_brands, through: :brand_stores)
  before_save(:capitalize_name)

  private

  def capitalize_name
    self.name = self.name.capitalize
  end
end
