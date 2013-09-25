require 'spec_helper'

describe RatingsController do
  let(:item){ FactoryGirl.create(:item) }

  describe "POST craete" do
    describe "when a user is sign in" do
      let(:user){ FactoryGirl.create(:user) }

      before(:each) do
        session[:user_id] = user.id
        @rating_attr = FactoryGirl.attributes_for(:rating)
      end

      it "assigns the requested item as @item" do
        post :create, {item_id: item.to_param, rating: @rating_attr}
        assigns(:item).should eq(item)
      end

      it "creates the item's Rating" do
        Rating.any_instance.should_receive(:save!)
        post :create, {item_id: item.to_param, rating: @rating_attr}
      end

      it "creates touch of a current user and an item." do
        Touch.should_receive(:create!)
        post :create, {item_id: item.to_param, rating: @rating_attr}
      end
    end

    describe "when no user is sign in" do
      it "redirects to signin path" do
        session[:user_id] = nil
        post :create, {item_id: item.to_param, rating: @rating_attr}
        response.should redirect_to(signin_path)
      end
    end
  end
end
