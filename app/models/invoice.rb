class Invoice < ActiveRecord::Base
  validates_presence_of   :business_id, :consigner_id
  
  after_validation :total!

  def invoiced_transactions; Transaction.find_all_by_invoice_id(id); end
  
  def products
    arr = []
    invoiced_transactions.each do |trans|
      arr[trans.product] = 
  end
  
  private
  
  def total!
    invoice      
  end

  def invoice
    Product.by_business_and_consigner(business_id, consigner_id).each do |prod|
      Transaction.sold_and_lost(prod.id).each{ |trans| trans.invoice!(id)}
    end
  end

end
