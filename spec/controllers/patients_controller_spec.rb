require "spec_helper"

describe PatientsController do
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


  describe "destroy a patient" do
    let(:patient) { FactoryGirl.create(:patient) }
    it "should decrement the patient count " do 
      expect do
        #xhr :delete, :destroy, id: patient.id  # execute by Ajax
        delete :destroy, id: patient.id
      end.to change(Patient, :count).by(1)
    end
  end

end