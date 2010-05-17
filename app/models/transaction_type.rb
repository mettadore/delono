class TransactionType < ActiveRecord::Base
  has_many  :transactions
  
  named_scope :sold,      :conditions => ["past = 'sold'"]
  named_scope :received,  :conditions => ["past = 'received'"]
  named_scope :restocked, :conditions => ["past = 'restocked'"]
  named_scope :lost,      :conditions => ["past = 'lost'"]
  named_scope :returned,  :conditions => ["past = 'returned'"]

  def self.type_id(past)
    TransactionType.send(past).first.id
  end
end
