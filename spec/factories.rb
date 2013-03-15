FactoryGirl.define do
    factory :location do
        sequence(:name) { |n| "Location Test #{n}"}
        sequence(:code) { |n| 10000+n }
    end
    factory :patient do
        first_name "firest"
        middle_name "middle"
        last_name "last"
        status "Initial"
        gender "Male"
        location_id "2"
        birth "2013-03-01 090101"
        viewed_count "1" 
    end
end