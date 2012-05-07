require "spec_helper"

describe GmpsController do
  describe "routing" do

    it "routes to #index" do
      get("/gmps").should route_to("gmps#index")
    end

    it "routes to #new" do
      get("/gmps/new").should route_to("gmps#new")
    end

    it "routes to #show" do
      get("/gmps/1").should route_to("gmps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gmps/1/edit").should route_to("gmps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gmps").should route_to("gmps#create")
    end

    it "routes to #update" do
      put("/gmps/1").should route_to("gmps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gmps/1").should route_to("gmps#destroy", :id => "1")
    end

  end
end
