require 'spec_helper'

describe Link do
  it "has a title" do
    FactoryGirl.build(:link).should be_valid
    FactoryGirl.build(:link, title: nil).should_not be_valid
  end

  it "has a url" do
    FactoryGirl.build(:link).should be_valid
    FactoryGirl.build(:link, url: nil).should_not be_valid
  end

  it "belongs to a sub" do
    should belong_to(:sub)
    FactoryGirl.create(:link).sub.should be_instance_of(Sub)
  end
  it "belongs to a user" do
    should belong_to(:submitter)
    FactoryGirl.create(:link).submitter.should be_instance_of(User)
  end
end
