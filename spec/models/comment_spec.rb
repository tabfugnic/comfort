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

  describe "#topic" do
    let(:topic) { FactoryGirl.create(:topic) }

    it "returns the topic associated with it" do
      comment = FactoryGirl.create(:comment, commentable_id: topic.id )
      comment.topic.should eq topic
    end

    it "finds the top level topic" do
      comment = FactoryGirl.create(:comment, commentable_id: topic.id )
      comment = FactoryGirl.create(:comment, :comment, commentable_id: comment.id )
      comment.topic.should eq topic
    end

  end
end
