require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "show a location " do
       get 'home'
       @location = Location.find(1)
     end
  end
end

 