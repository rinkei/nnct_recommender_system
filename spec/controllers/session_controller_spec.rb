require 'spec_helper'

describe SessionController do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      describe "of a persisted user" do
        it "assigns the requested user as @user" do
          user = FactoryGirl.create(:user)
          post :create, {:user => {:handle => user.handle}}
          assigns(:user).should be_a(User)
          assigns(:user).should be_persisted
        end

        it "redirects to root" do
          user = FactoryGirl.create(:user)
          post :create, {:user => {:handle => user.handle}}
          response.should redirect_to(root_path)
        end
      end

      describe "of not persisted user" do
        it "assigns the requested user but not found in tables" do
          post :create, {:user => {:handle => "not_persisted"}}
          assigns(:user).should be_a_new(User)
        end
      end
    end

    describe "with invalid params" do
      it "assigns the requested user but has invalid params" do
        post :create, {:user => FactoryGirl.attributes_for(:invalid_attributes_user)}
        assigns(:user).should be_a_new(User)
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
    end

    it "destroys the requested user's session" do
      delete :destroy
      assigns(:current_user).should be_nil
    end

    it "redirects to root" do
      delete :destroy
      response.should redirect_to(root_path)
    end
  end

end
