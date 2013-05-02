Feature: Rating topics
  In order to determine what should be talked about
  As a user
  I should be able to rate topics

  @javascript
  Scenario: Rating comfort and interest sliders
    Given I am signed in
    And a topic exists
    And I am on a topic page
    When I adjust comfort
    Then I should see the priority change
    When I adjust interest
    Then I should see the priority change

