namespace :db do 
	desc "Fill database with sample data . "
	task populate: :environment do
		location1 = Location.create!(name: "Test Location 1", code: "1234")
		location2 = Location.create!(name: "Test Location 2", code: "1235")
      	end
end