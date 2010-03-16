require 'spec_helper'

describe Business do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :street => "value for street",
      :street_2 => "value for street_2",
      :city => "value for city",
      :state => "value for state",
      :zipcode => 1,
      :email => "value for email",
      :website => "value for website",
      :fax => 1,
      :owner_id => 1,
      :phone => 1,
      :subdomain => "subdomain"
    }
  end

  it "should create a new instance given valid attributes" do
    Business.create!(@valid_attributes)
  end
 
  describe "managers and users" do    
    before(:each) do
      @user = mock_model User
      @user2 = mock_model User
      @business = mock_model Business
    end
    
    it "should have zero users on creation" do
      @business.stub(:users).and_return([])
      @business.users.should have(0).items
    end
    it "should have zero managers on creation" do
      @business.stub(:managers).and_return([])
      @business.managers.should have(0).items
    end
    it "should return a list of users" do
      @business.stub(:managers).and_return([@user, @user2])
      @business.managers.should have(2).items
      @business.managers.first.should eql(@user)
      @business.managers.second.should equal(@user2)
    end

    describe "adding managers" do
      it "should add a user to the managers list" do
        @business.add_manager(@user)
        @business.managers.first.should eql(@user)
      end
    end

    it "should add a user to the users list" do
      # @business.add_user(@user)
      # @business.users.first.should eql(@user)
    end
    
    it "should add a user to the managers list when the user is in the users list" do
      # @business.add_user(@user)
      # @business.add_manager(@user)
      # @business.managers.first.should eql(@user)
    end

    it "should smartly add managers without duplicating in user table" do
      # @business.add_user(@user)
      # @business.add_manager(@user)
      # @business.users.should have(0).items
      # @business.managers.first.should eql(@user)
    end
    
    it "should smartly remove managers without duplicating in user table" do
      # @business.add_manager(@user)
      # @business.remove_manager(@user)
      # @business.managers.should have(0).items
      # @business.users.first.should eql(@user)
    end
    
    it "should remove users completely when they are managers" do
      # @business.add_manager(@user)
      # @business.remove_user(@user)
      # @business.managers.should have(0).items
      # @business.users.should have(0).items
    end
    it "should remove users completely when they are users" do
      # @business.add_user(@user)
      #   @business.remove_user(@user)
      #   @business.managers.should have(0).items
      #   @business.users.should have(0).items
      end
  end
end
