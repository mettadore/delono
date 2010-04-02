class Invoice < ActiveRecord::Base
  belongs_to  :business
  belongs_to  :consigner
  validates_presence_of   :business_id, :consigner_id, :date
  
  before_validation :set_date!
  after_save :invoice

  def invoiced_transactions; Transaction.find_all_by_invoice_id(id); end
  
  def products; @products ||= get_products; end

  def get_products
    arr = Hash.new
    invoiced_transactions.each do |trans|
      arr[trans.product] = Hash.new if arr[trans.product].nil?
      arr[trans.product][trans.wholesale] = 0 if arr[trans.product][trans.wholesale].nil?
      arr[trans.product][trans.wholesale] += 1
    end
    arr
  end
  
  def total
    @total ||= get_total!
  end
  
  private
  
  def set_date!
    self.date = Time.now if self.date.nil?
  end

  def get_total!
    sum = 0    
    products.each_pair do |k0, v0|
      v0.each_pair do |k1, v1|
        sum += k1 * v1
      end
    end
    sum
  end
  
  def invoice
    Product.by_business_and_consigner(business_id, consigner_id).each do |prod|
      Transaction.sold_and_lost(prod.id).each{ |trans| trans.invoice!(id)}
    end
  end

end
