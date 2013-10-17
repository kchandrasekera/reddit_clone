require 'spec_helper'

describe User do
  it "has a username" do
    FactoryGirl.build(:user).should be_valid
    FactoryGirl.build(:user, :username => nil).should_not be_valid
  end

  it "has a password" do
    FactoryGirl.build(:user).should be_valid
    FactoryGirl.build(:user, :password_digest => nil).should_not be_valid
  end

  it "password should be at least 6 characters" do
    FactoryGirl.build(:user, password: "short").should_not be_valid
  end

  it "should find by credentials" do
    new_user = FactoryGirl.create(:user)
    User.find_by_credentials(new_user.username, new_user.password).should == new_user
  end

  it "should reset session token" do
    new_user = FactoryGirl.create(:user)
    old_session_token = new_user.reset_session_token!
    new_session_token = new_user.reset_session_token!
    old_session_token.should_not == new_session_token
  end

  it "should have many subs" do
    should have_many(:subs)
    FactoryGirl.create(:user_with_subs).subs.first.should be_instance_of(Sub)
  end
end
