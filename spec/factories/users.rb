# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    password "MyString"
    subs do
      (1..3).map do
        FactoryGirl.create(:sub)
      end
    end
  end
end
