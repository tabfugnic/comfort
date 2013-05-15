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

  describe "#display_name" do
    it "displays first name and last name" do
      user = FactoryGirl.create(:user)
      user.display_name.should eq "#{user.first_name} #{user.last_name}"
    end

    it "displays first name without last name" do
      user = FactoryGirl.create(:user, last_name: nil)
      user.display_name.should eq user.first_name
    end

    it "displays email address without first name" do
      user = FactoryGirl.create(:user, first_name: nil)
      user.display_name.should eq user.email
    end
  end
end

