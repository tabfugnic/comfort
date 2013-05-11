Feature: Build Topics
  In order to start discussions
  Users must be able to create topics

  Scenario: Create a valid topic
    Given I am signed in
    When I follow the create topic link
    And submit valid topic data
    Then I should see the topic submitted successfully

  Scenario: Create an invalid topic
    Given I am signed in
    When I follow the create topic link
    And submit invalid topic data
    Then I should see errors for the topic
