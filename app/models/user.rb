class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_taggable_on   :subdomains
  
  has_many  :assignments
  has_many  :manages,   :through => :assignments
  has_many  :uses,      :through => :assignments
  
  validates_presence_of :first_name, :last_name, :username, :email

  def owns
    Business.owned_by(id)
  end
  
  def owner?
    owns.length != 0
  end

end
