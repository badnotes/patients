class StaticPagesController < ApplicationController
  def home
  	@locations = Location.all
  	@patients = Patient.all
  end
end
