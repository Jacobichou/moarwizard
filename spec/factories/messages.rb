# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    pein 1
    subject "Parps"
    content "Hairy potato butts"
    recipient_pein 1
    created_at "2014-04-22 11:35:13"
    # user
  end
end