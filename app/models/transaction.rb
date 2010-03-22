class Transaction < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :business
  belongs_to  :transaction_type
  validates_presence_of :retail, :wholesale, :business_id, :product_id, :transaction_type_id
  
  before_validation :set_prices!
  
  named_scope :noninvoiced,  :conditions => ["invoiced => false"]
  named_scope :invoiced,  :conditions => ["invoiced => true"]
  named_scope :by_business, lambda { |id| {:conditions => ["business_id = ?", id]}}
  named_scope :received_by_product,  lambda { |id| {:conditions => ["transaction_type_id = ? AND product_id = ?", TransactionType.type_id("received"), id]}}
  named_scope :sold_by_product,  lambda { |id| {:conditions => ["transaction_type_id = ? AND product_id = ?", TransactionType.type_id("sold"), id]}}
  named_scope :restocked_by_product,  lambda { |id| {:conditions => ["transaction_type_id = ? AND product_id = ?", TransactionType.type_id("restocked"), id]}}
  named_scope :returned_by_product,  lambda { |id| {:conditions => ["transaction_type_id = ? AND product_id = ?", TransactionType.type_id("returned"), id]}}
  named_scope :lost_by_product,  lambda { |id| {:conditions => ["transaction_type_id = ? AND product_id = ?", TransactionType.type_id("lost"), id]}}

  private
  
  def set_prices!
    set_wholesale!
    set_retail!
  end
  def set_wholesale!    
    self.wholesale = product.wholesale if not wholesale
  end
  def set_retail!    
    self.retail = product.retail if not retail
  end

end
