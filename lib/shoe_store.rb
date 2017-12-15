class ShoeStore < ActiceRecord::Base
  has_many :brand_stores
  has_many :brands, through: :brand_stores
end
