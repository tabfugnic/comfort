Given /a topic exists/ do
  @topic = FactoryGirl.create(:topic)
end

Given /(\d+) topics exist/ do |num|
  @topics = FactoryGirl.create_list(:topic, num.to_i)
end

Given /am on a topic page/ do
  visit topic_path(@topic)
end

When /(?:follow|go to|am on|visit) the create topic (?:link|page)/ do
  visit new_topic_path
end

When /(?:follow|go to|visit) the topic index ?(?:|link|page)/ do
  visit topics_path
end

When /submit valid topic (?:form|data)/ do
  topic = FactoryGirl.attributes_for(:topic)
  fill_in "topic_description", with: topic[:description]
  fill_in "topic_name", with: topic[:name]
  click_on "Save"
end

When /submit invalid topic (?:form|data)/ do
  click_on "Save"
end

When /adjust comfort/ do
  @priority ||= find("#priority-index").text.to_i
  fill_in("comfort-index", with: 30)
end

When /adjust interest/ do
  @priority ||= find("#priority-index").text.to_i
  fill_in("interest-index", with: 20)
end

Then /should see the priority change/ do
  find("#priority-index").click
  find("#priority-index").text.to_i.should_not eq(@priority)
end

Then /should see the topic submitted successfully/ do
  page.should have_content(/Topic was successfully created/)
end

Then /should see errors for the topic/ do
  page.should have_content(/prohibited this topic/)
end
