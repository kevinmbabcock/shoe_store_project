class ShoeBrand < ActiveRecord::Base
  has_many(:brand_stores)
  has_many(:shoe_stores, through: :brand_stores)
  # before_save(:dollar_sign)

# private
#   def dollar_sign
#     self.price.prepend("$")
#   end

end
