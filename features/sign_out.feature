Feature: Sign out
  In order to inform potential users about the site
  As a guest
  I should have place to go

  Scenario: Landing on the homepage
    Given I am not signed in
    When I visit the root url
    Then I should see the signed out landing page

  Scenario: Signing out from the main app
    Given I am signed in
    When I sign out
    Then I should see the signed out landing page
