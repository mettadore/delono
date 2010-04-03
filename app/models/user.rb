class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_taggable_on   :subdomains
  
  has_many  :assignments
  has_many  :manages,   :through => :assignments, :source => :business
  has_many  :uses,      :through => :assignments, :source => :business
  
  has_many  :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  belongs_to  :invitation
  
  before_create :set_invitation_limit
  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  validates_presence_of :invitation_id, :message => "You must be invited to use Delono"
  validates_uniqueness_of :invitation_id

  def owns
    Business.owned_by(id)
  end
  
  def owner?
    owns.length != 0
  end
  
  def add_business_managed(business)
    self.manages << business if not self.manages.index(business)
  end

  def invitation_token
    invitation.token if invitation
  end
  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end

  private
  
  def set_invitation_limit
    self.invitation_limit = 4
  end
end
