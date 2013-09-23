require 'spec_helper'

describe Admin::RatingsController do
  describe "GET index" do
    it "assigns all ratings as @ratings" do
      general_rating = FactoryGirl.create(:general_rating)
      get :index

      assigns(:ratings).should include(general_rating)
    end
  end

  describe "GET search" do
    it "assigns specified ratings as @ratings by paramters" do
      general_rating = FactoryGirl.create(:general_rating)
      looks_rating = FactoryGirl.create(:looks_rating)
      get :search, {rating_condition: {type: 'GeneralRating'}}

      assigns(:ratings).should include(general_rating)
      assigns(:ratings).should_not include(looks_rating)
    end
  end

  describe "GET csv" do
  end
end
