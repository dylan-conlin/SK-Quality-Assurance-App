require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CelebritiesController do

  # This should return the minimal set of attributes required to create a valid
  # Celebrity. As you add validations to Celebrity, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CelebritiesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all celebrities as @celebrities" do
      celebrity = Celebrity.create! valid_attributes
      get :index, {}, valid_session
      assigns(:celebrities).should eq([celebrity])
    end
  end

  describe "GET show" do
    it "assigns the requested celebrity as @celebrity" do
      celebrity = Celebrity.create! valid_attributes
      get :show, {:id => celebrity.to_param}, valid_session
      assigns(:celebrity).should eq(celebrity)
    end
  end

  describe "GET new" do
    it "assigns a new celebrity as @celebrity" do
      get :new, {}, valid_session
      assigns(:celebrity).should be_a_new(Celebrity)
    end
  end

  describe "GET edit" do
    it "assigns the requested celebrity as @celebrity" do
      celebrity = Celebrity.create! valid_attributes
      get :edit, {:id => celebrity.to_param}, valid_session
      assigns(:celebrity).should eq(celebrity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Celebrity" do
        expect {
          post :create, {:celebrity => valid_attributes}, valid_session
        }.to change(Celebrity, :count).by(1)
      end

      it "assigns a newly created celebrity as @celebrity" do
        post :create, {:celebrity => valid_attributes}, valid_session
        assigns(:celebrity).should be_a(Celebrity)
        assigns(:celebrity).should be_persisted
      end

      it "redirects to the created celebrity" do
        post :create, {:celebrity => valid_attributes}, valid_session
        response.should redirect_to(Celebrity.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved celebrity as @celebrity" do
        # Trigger the behavior that occurs when invalid params are submitted
        Celebrity.any_instance.stub(:save).and_return(false)
        post :create, {:celebrity => {}}, valid_session
        assigns(:celebrity).should be_a_new(Celebrity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Celebrity.any_instance.stub(:save).and_return(false)
        post :create, {:celebrity => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested celebrity" do
        celebrity = Celebrity.create! valid_attributes
        # Assuming there are no other celebrities in the database, this
        # specifies that the Celebrity created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Celebrity.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => celebrity.to_param, :celebrity => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested celebrity as @celebrity" do
        celebrity = Celebrity.create! valid_attributes
        put :update, {:id => celebrity.to_param, :celebrity => valid_attributes}, valid_session
        assigns(:celebrity).should eq(celebrity)
      end

      it "redirects to the celebrity" do
        celebrity = Celebrity.create! valid_attributes
        put :update, {:id => celebrity.to_param, :celebrity => valid_attributes}, valid_session
        response.should redirect_to(celebrity)
      end
    end

    describe "with invalid params" do
      it "assigns the celebrity as @celebrity" do
        celebrity = Celebrity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Celebrity.any_instance.stub(:save).and_return(false)
        put :update, {:id => celebrity.to_param, :celebrity => {}}, valid_session
        assigns(:celebrity).should eq(celebrity)
      end

      it "re-renders the 'edit' template" do
        celebrity = Celebrity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Celebrity.any_instance.stub(:save).and_return(false)
        put :update, {:id => celebrity.to_param, :celebrity => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested celebrity" do
      celebrity = Celebrity.create! valid_attributes
      expect {
        delete :destroy, {:id => celebrity.to_param}, valid_session
      }.to change(Celebrity, :count).by(-1)
    end

    it "redirects to the celebrities list" do
      celebrity = Celebrity.create! valid_attributes
      delete :destroy, {:id => celebrity.to_param}, valid_session
      response.should redirect_to(celebrities_url)
    end
  end

end
