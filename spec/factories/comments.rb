# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    parent_comment_id 1
    link_id 1
    link do
      FactoryGirl.create(:link)
    end
    body "MyText"
    user_id 1
    user do
      FactoryGirl.create(:user)
    end
    factory :comment_with_children do
      children do
        (1..3).map do
          FactoryGirl.create(:comment)
        end
      end
    end
  end
end
