class Consigner < ActiveRecord::Base
  has_many :consigner_businesses
  has_many :businesses,   :through => :consigner_businesses
  has_many :products
  has_many :invoices
  belongs_to  :last_invoice, :class_name => 'Invoice', :foreign_key => :invoice_id
  
  validates_presence_of :name
  
  def invoice!(invoice)
    self.last_invoice = invoice
    self.save!
  end
  
end
