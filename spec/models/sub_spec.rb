require 'spec_helper'

describe Sub do
  it "has a name" do
    FactoryGirl.build(:sub).should be_valid
    FactoryGirl.build(:sub, :name => nil).should_not be_valid
  end

  it "has a moderator" do
    FactoryGirl.build(:sub).should be_valid
    FactoryGirl.build(:sub, :moderator_id => nil).should_not be_valid
  end

  it "belongs to a moderator" do
    should belong_to(:moderator)
    FactoryGirl.create(:sub).moderator.should be_instance_of(User)
  end
end
