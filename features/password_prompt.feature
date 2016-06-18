Feature: password in call
  Scenario: All in command-line arguments
    When I run `password_characters foobar 1,4,6`
    Then it should pass with:
      """
      f b r
      """

  Scenario: interactive
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,4,6"
    Then it should pass with:
      """
      f b r
      """

  Scenario: no indices
    When I run `password_characters` interactively
    And I type "foobar"
    And I type ""
    Then it should fail with:
      """
      [] does not ask for any characters
      """

  Scenario: duplicate indices
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,1"
    Then it should fail with:
      """
      1 duplicated in [1, 1]
      """

  Scenario: unsorted
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "2,1"
    Then it should fail with:
      """
      [2, 1] is not in ascending order
      """

  Scenario: range
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "5,7"
    Then it should fail with:
      """
      7 out of bounds
      """

  Scenario: subset
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,2,3,4,5,6"
    Then it should fail with:
      """
      [1, 2, 3, 4, 5, 6] would reveal entire password
      """