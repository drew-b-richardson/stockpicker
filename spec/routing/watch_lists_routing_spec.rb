require "spec_helper"

describe WatchListsController do
  describe "routing" do

    it "routes to #index" do
      get("/watch_lists").should route_to("watch_lists#index")
    end

    it "routes to #new" do
      get("/watch_lists/new").should route_to("watch_lists#new")
    end

    it "routes to #show" do
      get("/watch_lists/1").should route_to("watch_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/watch_lists/1/edit").should route_to("watch_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/watch_lists").should route_to("watch_lists#create")
    end

    it "routes to #update" do
      put("/watch_lists/1").should route_to("watch_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/watch_lists/1").should route_to("watch_lists#destroy", :id => "1")
    end

  end
end
