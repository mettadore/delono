require 'spec_helper'

describe ConsignersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/consigners" }.should route_to(:controller => "consigners", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/consigners/new" }.should route_to(:controller => "consigners", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/consigners/1" }.should route_to(:controller => "consigners", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/consigners/1/edit" }.should route_to(:controller => "consigners", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/consigners" }.should route_to(:controller => "consigners", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/consigners/1" }.should route_to(:controller => "consigners", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/consigners/1" }.should route_to(:controller => "consigners", :action => "destroy", :id => "1") 
    end
  end
end
