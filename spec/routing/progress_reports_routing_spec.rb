require "spec_helper"

describe ProgressReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/progress_reports").should route_to("progress_reports#index")
    end

    it "routes to #new" do
      get("/progress_reports/new").should route_to("progress_reports#new")
    end

    it "routes to #show" do
      get("/progress_reports/1").should route_to("progress_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/progress_reports/1/edit").should route_to("progress_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/progress_reports").should route_to("progress_reports#create")
    end

    it "routes to #update" do
      put("/progress_reports/1").should route_to("progress_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/progress_reports/1").should route_to("progress_reports#destroy", :id => "1")
    end

  end
end
