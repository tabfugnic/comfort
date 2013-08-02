require 'spec_helper'

describe CommentsController do
  let(:topic) { FactoryGirl.create(:topic) }

  before do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end

  describe "POST /create" do
    it "creates a new comment" do
      comment_attr = FactoryGirl.attributes_for :comment, commentable_type: topic.class, commentable_id: topic.id
      expect { post :create, comment: comment_attr }.to change{ Comment.count }.by(1)
    end
    it "redirects to topics page" do
      comment_attr = FactoryGirl.attributes_for :comment, commentable_type: topic.class, commentable_id: topic.id
      post :create, comment: comment_attr
      response.should redirect_to topic
    end
    it "redirects back to topic for nested comment" do
      comment = FactoryGirl.create(:comment, commentable_id: topic.id)
      comment_attr = FactoryGirl.attributes_for :comment, :comment, commentable_id: comment.id
      post :create, comment: comment_attr
      response.should redirect_to topic
    end
  end
end
