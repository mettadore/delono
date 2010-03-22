class Product < ActiveRecord::Base
  belongs_to  :consigner
  belongs_to  :business
  has_many  :transactions
  
  named_scope :by_business_and_consigner,   lambda { |biz, cons| {:conditions => ["business_id = ? AND consigner_id = ?", biz, cons]}}

  def self.received(id); Transaction.received.by_product(id); end
  def self.sold(id); Transaction.sold.by_product(id); end
  def self.restocked(id); Transaction.restocked.by_product(id); end
  def self.returned(id); Transaction.returned.by_product(id); end
  def self.lost(id); Transaction.lost.by_product(id); end
  
  def self.received_this_period(id); Transaction.received.by_product(id).noninvoiced; end
  def self.sold_this_period(id); Transaction.sold.by_product(id).noninvoiced; end
  def self.restocked_this_period(id); Transaction.restocked.by_product(id).noninvoiced; end
  def self.returned_this_period(id); Transaction.returned.by_product(id).noninvoiced; end
  def self.lost_this_period(id); Transaction.lost.by_product(id).noninvoiced; end

  def received_count; Product.received(id).length; end
  def sold_count; Product.sold(id).length; end
  def restocked_count; Product.restocked(id).length; end
  def returned_count; Product.returned(id).length; end
  def lost_count; Product.lost(id).length; end

  def input_count; received_count + restocked_count; end
  def output_count; sold_count + returned_count + lost_count; end
  def sales; sold_count > 0 ? sold_count - restocked_count : 0; end

  def income_this_period
    sold_only = Product.sold_this_period(id) - Product.restocked_this_period(id)
    sold_only.inject(0){ |sum, prod| sum + prod.retail }
  end
  
  def cost_this_period
    sold_only = Product.sold_this_period(id) - Product.restocked_this_period(id)
    loss = Product.lost_this_period(id)
    total = sold_only + loss
    sold_only.inject(0){ |sum, prod| sum + prod.wholesale}
  end
  
  def count
    input_count - output_count
  end
end
