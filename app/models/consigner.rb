class Consigner < ActiveRecord::Base
  has_many :consigner_businesses
  has_many :businesses,   :through => :consigner_businesses
  has_many :products, :dependent => :destroy
  has_many :invoices
  belongs_to  :last_invoice, :class_name => 'Invoice', :foreign_key => :invoice_id
  
  validates_presence_of :name
  validates_uniqueness_of :name, :biz_name
  before_validation :downcase_name
  after_validation :humanize_name 
    
  def invoice!(invoice)
    self.last_invoice = invoice
    self.save!
  end
  def bizname; biz_name; end
  def name_or_bizname; biz_name ? biz_name : name; end

  def total_this_period
    products.inject(0){|sum, prod| sum + prod.cost_this_period}
  end
  
  private
  
  def downcase_name
    self.name.downcase!
    self.biz_name.downcase if attribute_present?("biz_name")
  end
  
  def humanize_name
    self.name = self.name.titleize
    self.biz_name = self.biz_name.titleize if attribute_present?("biz_name")
  end

end
