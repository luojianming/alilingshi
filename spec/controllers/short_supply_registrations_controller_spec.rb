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

describe ShortSupplyRegistrationsController do

  # This should return the minimal set of attributes required to create a valid
  # ShortSupplyRegistration. As you add validations to ShortSupplyRegistration, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShortSupplyRegistrationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all short_supply_registrations as @short_supply_registrations" do
      short_supply_registration = ShortSupplyRegistration.create! valid_attributes
      get :index, {}, valid_session
      assigns(:short_supply_registrations).should eq([short_supply_registration])
    end
  end

  describe "GET show" do
    it "assigns the requested short_supply_registration as @short_supply_registration" do
      short_supply_registration = ShortSupplyRegistration.create! valid_attributes
      get :show, {:id => short_supply_registration.to_param}, valid_session
      assigns(:short_supply_registration).should eq(short_supply_registration)
    end
  end

  describe "GET new" do
    it "assigns a new short_supply_registration as @short_supply_registration" do
      get :new, {}, valid_session
      assigns(:short_supply_registration).should be_a_new(ShortSupplyRegistration)
    end
  end

  describe "GET edit" do
    it "assigns the requested short_supply_registration as @short_supply_registration" do
      short_supply_registration = ShortSupplyRegistration.create! valid_attributes
      get :edit, {:id => short_supply_registration.to_param}, valid_session
      assigns(:short_supply_registration).should eq(short_supply_registration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ShortSupplyRegistration" do
        expect {
          post :create, {:short_supply_registration => valid_attributes}, valid_session
        }.to change(ShortSupplyRegistration, :count).by(1)
      end

      it "assigns a newly created short_supply_registration as @short_supply_registration" do
        post :create, {:short_supply_registration => valid_attributes}, valid_session
        assigns(:short_supply_registration).should be_a(ShortSupplyRegistration)
        assigns(:short_supply_registration).should be_persisted
      end

      it "redirects to the created short_supply_registration" do
        post :create, {:short_supply_registration => valid_attributes}, valid_session
        response.should redirect_to(ShortSupplyRegistration.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved short_supply_registration as @short_supply_registration" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShortSupplyRegistration.any_instance.stub(:save).and_return(false)
        post :create, {:short_supply_registration => { "name" => "invalid value" }}, valid_session
        assigns(:short_supply_registration).should be_a_new(ShortSupplyRegistration)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShortSupplyRegistration.any_instance.stub(:save).and_return(false)
        post :create, {:short_supply_registration => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested short_supply_registration" do
        short_supply_registration = ShortSupplyRegistration.create! valid_attributes
        # Assuming there are no other short_supply_registrations in the database, this
        # specifies that the ShortSupplyRegistration created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ShortSupplyRegistration.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => short_supply_registration.to_param, :short_supply_registration => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested short_supply_registration as @short_supply_registration" do
        short_supply_registration = ShortSupplyRegistration.create! valid_attributes
        put :update, {:id => short_supply_registration.to_param, :short_supply_registration => valid_attributes}, valid_session
        assigns(:short_supply_registration).should eq(short_supply_registration)
      end

      it "redirects to the short_supply_registration" do
        short_supply_registration = ShortSupplyRegistration.create! valid_attributes
        put :update, {:id => short_supply_registration.to_param, :short_supply_registration => valid_attributes}, valid_session
        response.should redirect_to(short_supply_registration)
      end
    end

    describe "with invalid params" do
      it "assigns the short_supply_registration as @short_supply_registration" do
        short_supply_registration = ShortSupplyRegistration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShortSupplyRegistration.any_instance.stub(:save).and_return(false)
        put :update, {:id => short_supply_registration.to_param, :short_supply_registration => { "name" => "invalid value" }}, valid_session
        assigns(:short_supply_registration).should eq(short_supply_registration)
      end

      it "re-renders the 'edit' template" do
        short_supply_registration = ShortSupplyRegistration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShortSupplyRegistration.any_instance.stub(:save).and_return(false)
        put :update, {:id => short_supply_registration.to_param, :short_supply_registration => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested short_supply_registration" do
      short_supply_registration = ShortSupplyRegistration.create! valid_attributes
      expect {
        delete :destroy, {:id => short_supply_registration.to_param}, valid_session
      }.to change(ShortSupplyRegistration, :count).by(-1)
    end

    it "redirects to the short_supply_registrations list" do
      short_supply_registration = ShortSupplyRegistration.create! valid_attributes
      delete :destroy, {:id => short_supply_registration.to_param}, valid_session
      response.should redirect_to(short_supply_registrations_url)
    end
  end

end
