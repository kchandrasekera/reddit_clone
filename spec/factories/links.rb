# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title "MyString"
    url "MyString"
    description "MyText"
    sub_id 1
    sub do
      FactoryGirl.create(:sub)
    end
    submitter_id 1
    submitter do
      FactoryGirl.create(:user)
    end
  end
end
