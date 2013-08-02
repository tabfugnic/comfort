require 'spec_helper'

describe "/topics/_topic.html.haml" do

  before do
    view.stub(:current_user).and_return user
    render "topic", topic: topic
  end

  context "when topic doesn't have priority" do

    let(:user) { stub_model(User, priority: 80) }
    let(:topic) { stub_model(Topic, priority: 20) }

    it "shows the user's personal rating" do
      rendered.should have_content "Personal Priority"
      rendered.should have_content user.priority
    end

    it "shows the user's personal rating" do
      rendered.should have_content "Team Priority"
      rendered.should have_content topic.priority
    end
  end

  context "when topic does have priority " do

    let(:user) { stub_model(User, priority: nil) }
    let(:topic) { stub_model(Topic, priority: nil) }

    it "shows the user's personal rating" do
      rendered.should have_content "Personal Priority"
      rendered.should have_content "No one has rated this topic yet"
    end

    it "shows the user's personal rating" do
      rendered.should have_content "Team Priority"
      rendered.should have_content "You have not rated this topic yet"
    end
  end
end
