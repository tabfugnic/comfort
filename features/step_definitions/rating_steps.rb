Given /rated each topic/ do
  @topics.each do |topic|
    FactoryGirl.create( :rating, topic: topic, user: @user )
  end
end

Then /see the priority rating/ do
  page.should have_selector "#priority-#{@topics.first.id}"
end

Then /each topic sorted by priority/ do
  all(".topic").first.should have_content(@topics.first.name)
  all(".topic").last.should have_content(@topics.last.name)
end
