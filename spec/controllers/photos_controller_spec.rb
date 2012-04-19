require 'spec_helper'

describe PhotosController do

  describe "GET 'save'" do
    it "returns http success" do
      get 'save'
      response.should be_success
    end
  end

  describe "GET 'my_list'" do
    it "returns http success" do
      get 'my_list'
      response.should be_success
    end
  end

end
