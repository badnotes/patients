require 'spec_helper'
describe "routing to patients" do
  it "routes /patients/:id to patients#show for id" do
    expect(:get => "/patients/1").to route_to(
      :controller => "patients",
      :action => "show",
      :id => "1"
    )
  end   

  it "routes /patients/id to patients#destroy for patient" do
    expect(:delete => "/patients/1").to route_to(
      :controller => "patients",
      :action => "destroy",
      :id => "1"
    )
  end
end