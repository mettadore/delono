require 'spec_helper'

describe BusinessesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/businesses" }.should route_to(:controller => "businesses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/businesses/new" }.should route_to(:controller => "businesses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/businesses/1" }.should route_to(:controller => "businesses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/businesses/1/edit" }.should route_to(:controller => "businesses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/businesses" }.should route_to(:controller => "businesses", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/businesses/1" }.should route_to(:controller => "businesses", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/businesses/1" }.should route_to(:controller => "businesses", :action => "destroy", :id => "1") 
    end
  end
end
