require 'spec_helper'



describe "/comments/_comment.html.haml" do
  let(:user) { stub_model(User, display_name: "Eric") }

  it "does not render reply when nested" do
    comment = stub_model(Comment, commentable_type: "Comment", user: user)
    render "comment", comment: comment
    rendered.should_not have_content "Reply"
  end
end
