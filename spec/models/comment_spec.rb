require 'spec_helper'

describe Comment do
  context "validations" do
    it "must have a valid factory" do
      FactoryGirl.build(:comment).should be_valid
    end
    it "must have content" do
      FactoryGirl.build(:comment, content: nil).should_not be_valid
    end
    it "must have commentable type" do
      FactoryGirl.build(:comment, commentable_type: nil).should_not be_valid
    end
    it "must have a commmentable id" do
      FactoryGirl.build(:comment, commentable_id: nil).should_not be_valid
    end
    it "must have a user" do
      FactoryGirl.build(:comment, user: nil).should_not be_valid
    end
  end
end
