require 'spec_helper'
describe TopicsController do
  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end
  describe "GET show" do
    before do
      @topic = FactoryGirl.create(:topic)
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
  describe "GET index" do
    before do
      @topics = FactoryGirl.create_list(:topic, 2)
      @topics.first.stub(:priority).and_return(0)
      @topics.last.stub(:priority).and_return(100)
    end
    it "displays topics in order of priority" do
      get :index
      assigns(:topics).first.should eq @topics.last
      assigns(:topics).last.should eq @topics.first
    end
  end
end
