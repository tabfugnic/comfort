Feature: Navigation
  In order to move about the site
  As a user
  I see a navigation bar throughout the site

  Scenario: Take me home logo
    Given I am signed in
    When I click the app logo
    Then I should see the topics index
