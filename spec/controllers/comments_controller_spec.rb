require 'spec_helper'

describe CommentsController do

  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end
  describe "POST /create" do
    it "creates a new comment" do
      topic = FactoryGirl.create(:topic)
      comment_attr = FactoryGirl.attributes_for :comment, commentable_type: topic.class, commentable_id: topic.id
      expect { post :create, comment: comment_attr }.to change{ Comment.count }.by(1)
    end
    it "redirects to topics page" do

    end
  end
end
