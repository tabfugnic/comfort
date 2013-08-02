require 'spec_helper'

describe Topic do
  let(:topic) { mock_model(Topic) }
  it { should be_instance_of(Topic) }

  context "validations" do
    it "factory is always valid" do
      FactoryGirl.build(:topic).should be_valid
    end

    it "validates presence of name" do
      FactoryGirl.build(:topic, name: "" ).should_not be_valid
      FactoryGirl.build(:topic, name: nil ).should_not be_valid
    end
  end

  describe "#priority" do
    it "takes an average of all ratings priority level" do
      topic = FactoryGirl.create(:topic, ratings: [ FactoryGirl.build(:rating, comfort: 0, interest: 100), FactoryGirl.build(:rating, comfort: 100, interest: 0) ])
      topic.priority.should eq 50
    end
    it "returns 0 if there are no ratings" do
      topic = FactoryGirl.create(:topic)
      topic.priority.should be_nil
    end
  end
end

