require 'spec_helper'

describe Rating do

  let(:rating) { mock_model(Rating) }
  it { should be_instance_of(Rating) }
  context "defaults" do

    it "defaults comfort and interest to 50" do
      rating = Rating.new
      rating.comfort.should eq(50)
      rating.interest.should eq(50)
    end
  end
  context "validations" do


    it "is valid" do
      rating = FactoryGirl.build(:rating)
      rating.should be_valid
    end
    it "validates that comfort and interest can't be above 100" do
      rating = FactoryGirl.build(:rating, interest: 101, comfort: 101)
      rating.should_not be_valid
    end
    it "validates that comfort and interest can't be below 0" do
      rating = FactoryGirl.build(:rating, interest: -1, comfort: -1)
      rating.should_not be_valid
    end
  end
end
