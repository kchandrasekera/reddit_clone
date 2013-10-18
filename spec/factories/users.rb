# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    password "MyString"
    factory :user_with_subs do
      subs do
        (1..3).map do
          FactoryGirl.create(:sub)
        end
      end
    end
    factory :user_with_links do
      links do
        (1..3).map do
          FactoryGirl.create(:link)
        end
      end
    end
  end
end
