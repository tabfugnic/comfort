require 'spec_helper'

describe RatingsController do
  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end
  describe "PUT /update" do
    it "updates a rating" do
      topic = FactoryGirl.create(:topic)
      rating = FactoryGirl.create(:rating, topic: topic, user: @user)
      rating.comfort = rating.comfort + 1
      put :update, topic_id: topic.to_param, id: rating.to_param, rating: { comfort: rating.comfort }
      assigns(:rating).should eq rating
    end
  end
  describe "POST /create" do
    it "creates a new rating" do
      topic = FactoryGirl.create(:topic)
      rating_attrs = FactoryGirl.attributes_for :rating, topic: topic
      expect { post :create, topic_id: topic.to_param, rating: rating_attrs }.to change { Rating.count }.by(1)
    end
  end
end
