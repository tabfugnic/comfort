Given /rated each topic/ do
  @topics.each do |topic|
    FactoryGirl.create( :rating, topic: topic, user: @user )
  end
end

Then /see the priority rating/ do
  page.should have_selector("#priority-#{@topics.first}")
end

Then /each topic sorted by priority/ do
  all(".topic").first.should have_content(@topic.first.name)
  all(".topic").first.should have_content(@topic.last.name)
end
