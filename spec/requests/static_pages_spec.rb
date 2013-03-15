require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get home_path
      response.status.should be(200)
    end

  subject {page} #! set page as default test subject

  describe "HomePage" do
    before { visit home_path } 
    #it { should have_content('locations') }   # include the part of locations
    it { should have_content('patients') }  # include the latest patients
  end

  end
end
