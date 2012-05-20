require 'spec_helper'

describe PointController do

  describe "GET 'give_point'" do
    it "returns http success" do
      get 'give_point'
      response.should be_success
    end
  end

end
