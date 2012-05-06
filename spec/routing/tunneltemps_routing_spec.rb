require "spec_helper"

describe TunneltempsController do
  describe "routing" do

    it "routes to #index" do
      get("/tunneltemps").should route_to("tunneltemps#index")
    end

    it "routes to #new" do
      get("/tunneltemps/new").should route_to("tunneltemps#new")
    end

    it "routes to #show" do
      get("/tunneltemps/1").should route_to("tunneltemps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tunneltemps/1/edit").should route_to("tunneltemps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tunneltemps").should route_to("tunneltemps#create")
    end

    it "routes to #update" do
      put("/tunneltemps/1").should route_to("tunneltemps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tunneltemps/1").should route_to("tunneltemps#destroy", :id => "1")
    end

  end
end
