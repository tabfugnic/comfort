require 'spec_helper'
describe TopicsController do

  describe "GET show" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
      session[:user_id] = @user.id
    end
    it "assigns the requested topic as @topic" do
      get :show, id: @topic.id
      assigns(:topic).should eq(@topic)
    end
    context "no relation exists between user and topic" do
      it "builds a relationship" do
        get :show, id: @topic.id
        assigns(:rating).should be_instance_of(Rating)
        assigns(:rating).should_not be_persisted
      end
    end
    context "a relationship exists between user and topic" do
      before do
        @rating = FactoryGirl.create(:rating, user: @user, topic:  @topic)
      end
      it "finds the previous rating relationship" do
        get :show, id: @topic.id
        assigns(:rating).should eq(@rating)
      end
    end
  end
end
