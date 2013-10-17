# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name "MyString"
    moderator_id 1
    moderator do
      FactoryGirl.create(:user)
    end
  end
end
