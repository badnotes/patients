require "spec_helper"

describe LocationsController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq("200")
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "destroy a location" do
    let(:location) { FactoryGirl.create(:location) }
    it "should decrement the Location count " do 
      expect do
        #xhr :delete, :destroy, id: location.id  # execute by Ajax
        delete :destroy, id: location.id
      end.to change(Location, :count).by(0)
    end
  end

end