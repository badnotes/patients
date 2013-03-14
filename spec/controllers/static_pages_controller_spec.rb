require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "show all locations " do
       get 'home'
       @location = Location.all
     end

     it "show all patients" do
        get 'home'
        @patients = Patient.all
      end

  end
end

 