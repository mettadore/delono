authorization do
  role :user do
    has_permission_on :businesses, :to => :manage
  end
end