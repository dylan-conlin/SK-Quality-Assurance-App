require "spec_helper"

describe ProductionChecksController do
  describe "routing" do

    it "routes to #index" do
      get("/production_checks").should route_to("production_checks#index")
    end

    it "routes to #new" do
      get("/production_checks/new").should route_to("production_checks#new")
    end

    it "routes to #show" do
      get("/production_checks/1").should route_to("production_checks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/production_checks/1/edit").should route_to("production_checks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/production_checks").should route_to("production_checks#create")
    end

    it "routes to #update" do
      put("/production_checks/1").should route_to("production_checks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/production_checks/1").should route_to("production_checks#destroy", :id => "1")
    end

  end
end
