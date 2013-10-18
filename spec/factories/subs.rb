# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name "MyString"
    moderator_id 1
    moderator do
      FactoryGirl.create(:user)
    end
    factory :sub_with_links do
      links do
        (1..3).map do
          FactoryGirl.create(:link)
        end
      end
    end
  end
end
