class Consigner < ActiveRecord::Base
  has_many :consigner_businesses
  has_many :businesses,   :through => :consigner_businesses
  has_many :products
  has_many :invoices
  belongs_to  :last_invoice, :class_name => 'Invoice', :foreign_key => :invoice_id
  
  validates_presence_of :name
  validates_uniqueness_of :name, :biz_name
  before_validation do
    self.name.downcase!
    self.biz_name.downcase if attribute_present?("biz_name")
  end

  after_validation do
    self.name.humanize!
    self.biz_name.humanize! if attribute_present?("biz_name")
  end
  
  def invoice!(invoice)
    self.last_invoice = invoice
    self.save!
  end
  def bizname; biz_name; end
  def name_or_bizname; biz_name ? biz_name : name; end
end
