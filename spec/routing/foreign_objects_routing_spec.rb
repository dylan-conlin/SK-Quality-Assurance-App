require "spec_helper"

describe ForeignObjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/foreign_objects").should route_to("foreign_objects#index")
    end

    it "routes to #new" do
      get("/foreign_objects/new").should route_to("foreign_objects#new")
    end

    it "routes to #show" do
      get("/foreign_objects/1").should route_to("foreign_objects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/foreign_objects/1/edit").should route_to("foreign_objects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/foreign_objects").should route_to("foreign_objects#create")
    end

    it "routes to #update" do
      put("/foreign_objects/1").should route_to("foreign_objects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/foreign_objects/1").should route_to("foreign_objects#destroy", :id => "1")
    end

  end
end
