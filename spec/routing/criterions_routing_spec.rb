require "spec_helper"

describe CriterionsController do
  describe "routing" do

    it "routes to #index" do
      get("/criterions").should route_to("criterions#index")
    end

    it "routes to #new" do
      get("/criterions/new").should route_to("criterions#new")
    end

    it "routes to #show" do
      get("/criterions/1").should route_to("criterions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/criterions/1/edit").should route_to("criterions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/criterions").should route_to("criterions#create")
    end

    it "routes to #update" do
      put("/criterions/1").should route_to("criterions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/criterions/1").should route_to("criterions#destroy", :id => "1")
    end

  end
end
