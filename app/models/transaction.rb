class Transaction < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :business
  belongs_to  :transaction_type
  belongs_to  :invoice
  validates_presence_of :retail, :wholesale, :business_id, :product_id, :transaction_type_id
  
  before_validation :set_prices!
  
  named_scope :noninvoiced,  :conditions => ["invoice_id = 0"]
  named_scope :invoiced,  :conditions => ["invoiced != 0"]
  named_scope :by_invoice,  lambda {|id| {:conditions => ["invoice_id = ?", id]}}
  named_scope :by_business, lambda { |id| {:conditions => ["business_id = ?", id]}}
  named_scope :by_product, lambda { |id| {:conditions => ["product_id = ?", id]}}

  named_scope :received,  :conditions => ["transaction_type_id = ?", TransactionType.type_id("received")]
  named_scope :sold,  :conditions => ["transaction_type_id = ?", TransactionType.type_id("sold")]
  named_scope :restocked,  :conditions => ["transaction_type_id = ?", TransactionType.type_id("restocked")]
  named_scope :returned,  :conditions => ["transaction_type_id = ?", TransactionType.type_id("returned")]
  named_scope :lost,  :conditions => ["transaction_type_id = ?", TransactionType.type_id("lost")]

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
