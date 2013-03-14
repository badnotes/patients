require 'spec_helper'

describe "LocationPages" do
  describe "GET /locations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/locations"
      response.status.should be(200)
    end 
 end

  subject { page }

     let(:location) { FactoryGirl.create(:location) }
     
     describe "Location creation" do
         before { visit "/locations/new" } 
         describe "with invalid data" do 
         	it "should not create a location" do 
         	    expect { click_link "Back"}.not_to change(Location, :count) 
         	end
         end
     end

     it { should_not have_link('New Location') }
     it { should_not have_link('Show') }
     it { should_not have_link('Edit') }
     it { should_not have_link('Delete') }
     describe " button destruction " do
         before { visit "/locations"}
         it "should Delete a location" do
         	# expect { click_link "Delete" }.to change(Location, :count).by(-1)
         end
     end         

end
