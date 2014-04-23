# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    user_id 1
    type 1
    attachment 1
    purpose "MyString"
    tests_performed "MyString"
    tests_request "MyString"
    included_specimen "MyString"
    lab_notes "MyString"
    request_notes "MyString"
  end
end
