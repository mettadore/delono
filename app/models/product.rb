class Product < ActiveRecord::Base
  belongs_to  :consigner
  belongs_to  :business
  has_many  :transactions
  
  def received(business)
    Transaction.received_by_product.by_business(business)
  end
  def sold(business)
    Transaction.sold_by_product.by_business(business)
  end
  def restocked(business)
    Transaction.restocked_by_product.by_business(business)
  end
  def returned(business)
    Transaction.returned_by_product.by_business(business)
  end
  def lost(business)
    Transaction.lost_by_product.by_business(business)
  end
  
  def count
    
  end
end
