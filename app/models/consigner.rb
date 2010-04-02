class Consigner < ActiveRecord::Base
  has_many :consigner_businesses
  has_many :businesses,   :through => :consigner_businesses
  has_many :products
  has_many :invoices
  
  validates_presence_of :name
  
  def invoice!(invoice)
    self.last_invoiced = invoice.date
    self.save!
  end
  
end
