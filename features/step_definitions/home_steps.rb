When /visit the root url/ do
  visit "/"
end

Then /should see the signed out landing page/ do
  page.should have_content "Welcome to Comfort!"
  page.should have_content "Please sign in"
end
