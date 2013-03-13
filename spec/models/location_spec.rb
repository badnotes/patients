require 'spec_helper'

describe Location do
    before do
        @location = Location.new(name: "Test Location 1", code: "1234")
    end

    subject { @location}

    it { should respond_to(:name) }
    it { should respond_to(:code) }

    it { should be_valid }

    describe "when name is not present" do
        before { @location.name = "" }
        it {should_not be_valid }
    end
    describe "when name is too long" do
        before { @location.name = "n" * 81 }
        it {should_not be_valid }
    end
    describe "when code is too long" do
        before { @location.code = 10**10 }
        it {should_not be_valid }
    end


end