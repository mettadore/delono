require 'spec_helper'

describe ConsignersController do

  def mock_consigner(stubs={})
    @mock_consigner ||= mock_model(Consigner, stubs)
  end

  describe "GET index" do
    it "assigns all consigners as @consigners" do
      Consigner.stub(:find).with(:all).and_return([mock_consigner])
      get :index
      assigns[:consigners].should == [mock_consigner]
    end
  end

  describe "GET show" do
    it "assigns the requested consigner as @consigner" do
      Consigner.stub(:find).with("37").and_return(mock_consigner)
      get :show, :id => "37"
      assigns[:consigner].should equal(mock_consigner)
    end
  end

  describe "GET new" do
    it "assigns a new consigner as @consigner" do
      Consigner.stub(:new).and_return(mock_consigner)
      get :new
      assigns[:consigner].should equal(mock_consigner)
    end
  end

  describe "GET edit" do
    it "assigns the requested consigner as @consigner" do
      Consigner.stub(:find).with("37").and_return(mock_consigner)
      get :edit, :id => "37"
      assigns[:consigner].should equal(mock_consigner)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created consigner as @consigner" do
        Consigner.stub(:new).with({'these' => 'params'}).and_return(mock_consigner(:save => true))
        post :create, :consigner => {:these => 'params'}
        assigns[:consigner].should equal(mock_consigner)
      end

      it "redirects to the created consigner" do
        Consigner.stub(:new).and_return(mock_consigner(:save => true))
        post :create, :consigner => {}
        response.should redirect_to(consigner_url(mock_consigner))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved consigner as @consigner" do
        Consigner.stub(:new).with({'these' => 'params'}).and_return(mock_consigner(:save => false))
        post :create, :consigner => {:these => 'params'}
        assigns[:consigner].should equal(mock_consigner)
      end

      it "re-renders the 'new' template" do
        Consigner.stub(:new).and_return(mock_consigner(:save => false))
        post :create, :consigner => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested consigner" do
        Consigner.should_receive(:find).with("37").and_return(mock_consigner)
        mock_consigner.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :consigner => {:these => 'params'}
      end

      it "assigns the requested consigner as @consigner" do
        Consigner.stub(:find).and_return(mock_consigner(:update_attributes => true))
        put :update, :id => "1"
        assigns[:consigner].should equal(mock_consigner)
      end

      it "redirects to the consigner" do
        Consigner.stub(:find).and_return(mock_consigner(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(consigner_url(mock_consigner))
      end
    end

    describe "with invalid params" do
      it "updates the requested consigner" do
        Consigner.should_receive(:find).with("37").and_return(mock_consigner)
        mock_consigner.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :consigner => {:these => 'params'}
      end

      it "assigns the consigner as @consigner" do
        Consigner.stub(:find).and_return(mock_consigner(:update_attributes => false))
        put :update, :id => "1"
        assigns[:consigner].should equal(mock_consigner)
      end

      it "re-renders the 'edit' template" do
        Consigner.stub(:find).and_return(mock_consigner(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested consigner" do
      Consigner.should_receive(:find).with("37").and_return(mock_consigner)
      mock_consigner.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the consigners list" do
      Consigner.stub(:find).and_return(mock_consigner(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(consigners_url)
    end
  end

end
