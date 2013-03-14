class StaticPagesController < ApplicationController
  def home
  	@locations = Location.all
  	@patients = Patient.find(:all, :conditions =>{ :is_deleted => false })
  end
end
