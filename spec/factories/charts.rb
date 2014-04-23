# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart do
    user_id 1
    bp "MyString"
    heart_rate "MyString"
    resp_rate 1
    temp 1
    given_symptoms "MyString"
    observed_symptoms "MyString"
    comments "MyString"
    diagnosis "MyString"
    prognosis "MyString"
    visit_purpose "MyString"
    preconditions "MyString"
    height 1
    weight 1
    verbal_instructions "MyString"
    notes "MyString"
    lab_request 1
    attachment_type 1
  end
end
