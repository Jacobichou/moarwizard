# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    user_id 1
    apt_date "2014-04-26 22:25:51"
    apt_time "2014-04-26 22:25:51"
    attending_physician 1
    rescheduled 1
  end
end
