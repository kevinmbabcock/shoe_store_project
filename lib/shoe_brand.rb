class ShoeBrand < ActiveRecord::Base
  validates(:name, {:presence => true})
  has_many(:brand_stores)
  has_many(:shoe_stores, through: :brand_stores)
  before_save(:capitalize_name)
  # before_save(:dollar_sign)

  private

  def capitalize_name
    self.name = self.name.capitalize!
  end

#   def dollar_sign
#     self.price.prepend("$")
#   end

end
