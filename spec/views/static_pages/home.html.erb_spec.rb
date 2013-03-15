require 'spec_helper'

describe "static_pages/home.html.erb" do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {page} #! set page as default test subject

  describe "HomePage" do
    before { visit home_path } 
    #it { should have_content('locations') }   # include the part of locations
    it { should have_content('patients') }  # include the latest patients
  end
 
 
end 

