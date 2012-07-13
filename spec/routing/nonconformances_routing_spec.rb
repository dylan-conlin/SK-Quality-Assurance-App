require "spec_helper"

describe NonconformancesController do
  describe "routing" do

    it "routes to #index" do
      get("/nonconformances").should route_to("nonconformances#index")
    end

    it "routes to #new" do
      get("/nonconformances/new").should route_to("nonconformances#new")
    end

    it "routes to #show" do
      get("/nonconformances/1").should route_to("nonconformances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/nonconformances/1/edit").should route_to("nonconformances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/nonconformances").should route_to("nonconformances#create")
    end

    it "routes to #update" do
      put("/nonconformances/1").should route_to("nonconformances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/nonconformances/1").should route_to("nonconformances#destroy", :id => "1")
    end

  end
end
