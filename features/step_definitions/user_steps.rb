Given /am an existing user/ do
  @user = FactoryGirl.create(:user)
  OmniAuth.config.add_mock :google_oauth2, { uid: @user.uid }
end

Given /am signed in/ do
  step "am an existing user"
  step "am not signed in"
  step "visit the sign in page"
  step "should be signed in"
end

Given /am not signed in/ do
  visit "/users/sign_out"
end

Given /am signed out/ do
  step "am not signed in"
end

When /(?:go to|visit) the sign in page/ do
  visit "/users/sign_in"
end

When /sign out/ do
  step "am not signed in"
end

Then /should be signed in(to my account)?/ do |me|
  page.should have_content("You have been signed in successfully.")
  page.should have_content(@user.email) if me
end
