require "spec_helper"

describe PackagingsController do
  describe "routing" do

    it "routes to #index" do
      get("/packagings").should route_to("packagings#index")
    end

    it "routes to #new" do
      get("/packagings/new").should route_to("packagings#new")
    end

    it "routes to #show" do
      get("/packagings/1").should route_to("packagings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/packagings/1/edit").should route_to("packagings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/packagings").should route_to("packagings#create")
    end

    it "routes to #update" do
      put("/packagings/1").should route_to("packagings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/packagings/1").should route_to("packagings#destroy", :id => "1")
    end

  end
end
