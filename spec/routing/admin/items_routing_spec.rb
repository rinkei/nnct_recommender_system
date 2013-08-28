require "spec_helper"

describe Admin::ItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/items").should route_to("admin/items#index")
    end

    it "routes to #new" do
      get("/admin/items/new").should route_to("admin/items#new")
    end

    it "routes to #show" do
      get("/admin/items/1").should route_to("admin/items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/items/1/edit").should route_to("admin/items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/items").should route_to("admin/items#create")
    end

    it "routes to #update" do
      put("/admin/items/1").should route_to("admin/items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/items/1").should route_to("admin/items#destroy", :id => "1")
    end

  end
end
