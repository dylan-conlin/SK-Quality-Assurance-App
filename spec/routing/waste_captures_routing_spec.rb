require "spec_helper"

describe WasteCapturesController do
  describe "routing" do

    it "routes to #index" do
      get("/waste_captures").should route_to("waste_captures#index")
    end

    it "routes to #new" do
      get("/waste_captures/new").should route_to("waste_captures#new")
    end

    it "routes to #show" do
      get("/waste_captures/1").should route_to("waste_captures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/waste_captures/1/edit").should route_to("waste_captures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/waste_captures").should route_to("waste_captures#create")
    end

    it "routes to #update" do
      put("/waste_captures/1").should route_to("waste_captures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/waste_captures/1").should route_to("waste_captures#destroy", :id => "1")
    end

  end
end
