require 'spec_helper'

describe ItemsController do
  let(:item){ FactoryGirl.create(:item) }

  describe "GET index" do
    it "assigns all items as @items" do
      get :index, {}
      assigns(:items).should eq([item])
    end
  end

  describe "GET show" do
    it "assigns the requested item as @item" do
      get :show, {:id => item.to_param}
      assigns(:item).should eq(item)
    end

    describe "when a user is sign in" do
      let(:user){ FactoryGirl.create(:user) }

      before(:each) do
        session[:user_id] = user.id
      end

      it "create a seeing for the touch." do
        SeeingPage.should_receive(:create!)
        get :show, {id: item.to_param}
      end

      it "create touch of a current user and an item." do
        Touch.should_receive(:create!)
        get :show, {id: item.to_param}
      end
    end 
  end

  describe "GET recommended" do
    describe "when a user is sign in" do
      let(:current_user){ FactoryGirl.create(:user) }
      let(:recommended_item){ FactoryGirl.create(:item) }

      it "assigns the recommended items as @items" do
        controller.stub(:current_user).and_return(current_user)
        Item.should_receive(:recommended_for).with(current_user).and_return([recommended_item])
        get :recommended
        assigns(:items).should eq [recommended_item]
      end
    end

    describe "when a user is not sign in" do
      it "redirects to sign in page" do
        get :recommended
      end
    end
  end
end
