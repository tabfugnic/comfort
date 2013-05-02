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
end
