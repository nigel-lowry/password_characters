@announce
Feature: Password in call
  Scenario: All in command-line arguments
    When I run `password_characters foobar 1,4,6`
    Then it should pass with:
      """
      f b r
      """

  Scenario: Interactive
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,4,6"
    Then the output should match:
      """
      f b r
      """