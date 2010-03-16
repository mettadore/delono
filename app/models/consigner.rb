class Consigner < ActiveRecord::Base
  has_many :consigner_businesses
  has_many :businesses,   :through => :consigner_businesses
  has_many :products
end
