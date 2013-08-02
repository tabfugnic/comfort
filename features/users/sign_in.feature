Feature: Sign in
  In order to use this site at all
  As a user
  I must be signed in

  Scenario: Sign in a user that exists
    Given I am an existing user
    And I am not signed in
    When I visit the sign in page using my google
    Then I should be signed into my account

  Scenario: Sign in a new user
    Given I am not signed in
    When I visit the sign in page using my google account
    Then I should be signed in
