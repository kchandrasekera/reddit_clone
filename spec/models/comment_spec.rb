require 'spec_helper'

describe Comment do
  it "has a body" do
    FactoryGirl.build(:comment).should be_valid
    FactoryGirl.build(:comment, body: nil).should_not be_valid
  end

  it "has a link_id" do
    FactoryGirl.build(:comment).should be_valid
    FactoryGirl.build(:comment, link_id: nil).should_not be_valid
  end

  it "has a user_id" do
    FactoryGirl.build(:comment).should be_valid
    FactoryGirl.build(:comment, user_id: nil).should_not be_valid
  end

  it "belongs to a user" do
    should belong_to(:user)
    FactoryGirl.create(:comment).user.should be_instance_of(User)
  end

  it "belongs to a link" do
    should belong_to(:link)
    FactoryGirl.create(:comment).link.should be_instance_of(Link)
  end

  it "has many child comments" do
    should have_many(:children)
    FactoryGirl.create(:comment_with_children).children.first.should be_instance_of(Comment)
  end

end