class ShoeBrand < ActiveRecord::Base
  has_many :brand_stores
  has_many :locations, through: :brand_stores
end
