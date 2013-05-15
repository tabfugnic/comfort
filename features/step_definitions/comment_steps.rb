When /comment on a topic/ do
  @comment_text = "Random text"
  fill_in("Content", with: @comment_text)
end

When /comment on a comment/ do
  @comment_text = "More text"
  find(:css, ".comment-reply").click
  fill_in("#new_comment", with: @comment_text)
end

Then /comment should be added/ do
  page.should have_content @comment_text
end
