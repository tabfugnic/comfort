require 'spec_helper'

describe User do

  it { FactoryGirl.build(:user).should be_a User }

  context "has many topics" do
    subject { FactoryGirl.create(:user) }

    it "does not error when calling topics" do
      expect { subject.topics }.to_not raise_error
    end

    it "can add new topics" do
      expect { subject.topics << FactoryGirl.build(:topic) }.to_not raise_error
    end
  end
end

