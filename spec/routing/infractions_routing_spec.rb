require "spec_helper"

describe InfractionsController do
  describe "routing" do

    it "routes to #index" do
      get("/infractions").should route_to("infractions#index")
    end

    it "routes to #new" do
      get("/infractions/new").should route_to("infractions#new")
    end

    it "routes to #show" do
      get("/infractions/1").should route_to("infractions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/infractions/1/edit").should route_to("infractions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/infractions").should route_to("infractions#create")
    end

    it "routes to #update" do
      put("/infractions/1").should route_to("infractions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/infractions/1").should route_to("infractions#destroy", :id => "1")
    end

  end
end
