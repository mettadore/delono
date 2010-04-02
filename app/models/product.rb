class Product < ActiveRecord::Base
  belongs_to  :consigner
  belongs_to  :business
  has_many  :transactions
  
  named_scope :by_business_and_consigner,   lambda { |biz, cons| {:conditions => ["business_id = ? AND consigner_id = ?", biz, cons]}}
  validates_presence_of :consigner_id, :business_id, :code, :retail, :wholesale
  def before_validation_on_create
    def retail?; attribute_present?("retail"); end
    def wholesale?; attribute_present?("wholesale"); end
    if not retail? and not wholesale?
      errors.add(product, "Must have either a retail or a wholesale price")
    end
    unless wholesale? and retail?
      percent = (100 - consigner.percentage) * 0.01
      self.wholesale = self.retail * percent if retail? and not wholesale?
      self.retail = self.wholesale / percent if wholesale? and not retail?
    end
    self.code.upcase! if attribute_present?("code")
  end

  def received; Transaction.received.by_product(id); end
  def sold; Transaction.sold.by_product(id); end
  def restocked; Transaction.restocked.by_product(id); end
  def returned; Transaction.returned.by_product(id); end
  def lost; Transaction.lost.by_product(id); end

  def received_count; received.length; end
  def sold_count; sold.length; end
  def restocked_count; restocked.length; end
  def returned_count; returned.length; end
  def lost_count; lost.length; end
      
  def received_this_period; Transaction.received.by_product(id).noninvoiced; end
  def sold_this_period; Transaction.sold.by_product(id).noninvoiced; end
  def restocked_this_period; Transaction.restocked.by_product(id).noninvoiced; end
  def returned_this_period; Transaction.returned.by_product(id).noninvoiced; end
  def lost_this_period; Transaction.lost.by_product(id).noninvoiced; end

  def input_count; received.count + restocked.count; end
  def output_count; sold.count + returned.count + lost.count; end
  def sales; sold.count > 0 ? sold.count - restocked.count : 0; end
  
  def sales_this_period; sold_this_period.count > 0 ? sold_this_period.count - restocked_this_period.count : 0; end

  def income_this_period
    sold_only = sold_this_period - restocked_this_period
    sold_only.inject(0){ |sum, prod| sum + prod.retail }
  end
  
  def cost_this_period
    sold_only = sold_this_period - restocked_this_period
    loss = lost_this_period
    total = sold_only + loss
    sold_only.inject(0){ |sum, prod| sum + prod.wholesale}
  end
  
  def count
    input_count - output_count
  end
  
  private
  def upcase_code!
    self.code.upcase! if attribute_present?("code")
  end
end
