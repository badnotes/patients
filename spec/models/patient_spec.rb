require 'spec_helper'

describe Patient do

    before do 
        @patient = Patient.new( first_name: "firest", middle_name: "middle", last_name: "last", status: "Initial",
        	gender: "Male", location_id: "1234", birth: "2013-03-01 09:01:01", medical_record_number: "1", viewed_count: "1" )
    end

    subject { @patient }

    describe " when first_name is not present" do
        before { @patient.first_name = "" }
        it { should_not be_valid }
    end
    describe " when last_name is not present" do
        before { @patient.last_name = "" }
        it { should_not be_valid }
    end
    describe " when status is not present" do
        before { @patient.status = "" }
        it { should_not be_valid }
    end
    describe " when gender is not present" do
        before { @patient.gender = "" }
        it { should_not be_valid }
    end

    describe " when first_name is too long" do
        before { @patient.first_name = "n" * 31 }
        it { should_not be_valid }
    end
    describe " when middle_name is too long" do
        before { @patient.middle_name = "n" * 11 }
        it { should_not be_valid }
    end
    describe " when last_name is too long" do
        before { @patient.last_name = "n" * 31 }
        it { should_not be_valid }
    end

    describe " when gender is not in (Male Female Notavailable) " do
        before { @patient.gender = "boy" }
        it { should_not be_valid }
    end
    describe " when status is not in (Initial Referred Treatment Closed) " do
        before { @patient.status = "init" }
        it { should_not be_valid }
    end


end