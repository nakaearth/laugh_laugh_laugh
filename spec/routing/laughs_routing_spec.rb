require "spec_helper"

describe LaughsController do
  describe "routing" do

    it "routes to #index" do
      get("/laughs").should route_to("laughs#index")
    end

    it "routes to #new" do
      get("/laughs/new").should route_to("laughs#new")
    end

    it "routes to #show" do
      get("/laughs/1").should route_to("laughs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/laughs/1/edit").should route_to("laughs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/laughs").should route_to("laughs#create")
    end

    it "routes to #update" do
      put("/laughs/1").should route_to("laughs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/laughs/1").should route_to("laughs#destroy", :id => "1")
    end

  end
end
