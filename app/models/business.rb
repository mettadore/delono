class Business < ActiveRecord::Base
  has_attached_file :image

  belongs_to  :owner, :class_name => "User"
  has_many    :assignments
  has_many    :managers,  :through => :assignments, :uniq => true, :source => :user
  has_many    :users,   :through => :assignments, :uniq => true
  has_many    :consigner_businesses
  has_many    :consigners, :through => :consigner_businesses
  has_many    :products
  has_many    :transactions
  has_many    :invoices
  
  validates_presence_of :name, :subdomain, :owner_id
  validates_uniqueness_of :subdomain
  
  validates_format_of :subdomain, 
                      :with => /^[A-Za-z0-9-]+$/, 
                      :message => ' can only contain alphanumeric characters and dashes.', 
                      :allow_blank => true

  validates_exclusion_of :subdomain, 
                         :in => %w( support blog www billing help 
                                    api mail dev alpha beta delono), 
                         :message => " <strong>{{value}}</strong> is reserved and unavailable."

  validates_uniqueness_of :subdomain, :case_sensitive => false

  before_validation :downcase_subdomain
  
  named_scope :owned_by,  lambda {|id| { :conditions => ["owner_id = ?", id]}}

#  after_create :add_owner

  def check_manager(user); self.managers.include? user; end
  def check_user(user); self.users.include? user; end

  def add_manager!(user)
#    if not check_manager user
      self.managers << user
      self.save
#    end
  end

  def move_manager_to_user!(user)
    self.managers.delete(user)
    self.users << user
    self.save
  end
  
  def remove_manager!(user)
    self.managers.delete(user)
    self.save
  end
  
  def remove_user!(user)
    self.managers.delete(user)
    self.users.delete(user)
    self.save
  end
  
  def add_user!(user)
    self.users << user
    self.save
  end

  private
  def downcase_subdomain
    self.subdomain.downcase! if attribute_present?("subdomain")
  end

end
