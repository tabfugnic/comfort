Given /topic has a comment/ do
  @comment = FactoryGirl.create(:comment, commentable_type: "Topic", commentable_id: @topic.id, user: @user )
end

When /comment on a topic/ do
  @comment_text = "Random text"
  fill_in("comment[content]", with: @comment_text)
  click_on("Create Comment")
end

When /comment on a comment/ do
  @comment_text = "More text"
  find(:css, "#comment-#{@comment.id} .reply").click
  within(:css, "#comment-#{@comment.id}") do
    fill_in("comment[content]", with: @comment_text)
    click_on("Create Comment")
  end
end

Then /comment should be added for the topic/ do
  within(:css, ".comment") do
    page.should have_content @comment_text
  end
end

Then /comment should be added within the comment/ do
  within(:css, "#comment-#{@comment.id}.comment") do
    page.should have_content @comment_text
  end
end
