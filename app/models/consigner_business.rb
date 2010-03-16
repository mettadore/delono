class ConsignerBusiness < ActiveRecord::Base
  belongs_to  :consigner
  belongs_to  :business
end
