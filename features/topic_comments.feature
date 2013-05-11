Feature: Topic comments
  In order to have a convesation
  As a user
  I need to be able to comment on topics

  Scenario: User can comment on a topic
    Given I am signed in
    And a topic exists
    And I am on a topic page
    When I comment on a topic
    Then the comment should be added

  Scenario: User can comment on comments
    Given I am signed in
    And a topic exists
    And I am on a topic page
    When I comment on a comment
    Then the comment should be added
