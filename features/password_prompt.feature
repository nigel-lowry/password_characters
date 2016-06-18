Feature: password in call

  Commandline application for getting characters at specified position
  in a password, as is often asked for on Web sites such as Internet
  banking.

  Scenario: Pass in password and ordinals as command-line arguments
    When I run `password_characters foobar 1,4,6`
    Then it should pass with:
      """
      f b r
      """

  Scenario: Interactive session
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,4,6"
    Then it should pass with:
      """
      f b r
      """

  Scenario: Ordinals out of order
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,6,4"
    Then it should fail with:
      """
      [1, 6, 4] is not in ascending order
      """

  Scenario: Ordinals in descending order
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "2,1"
    Then it should fail with:
      """
      [2, 1] is not in ascending order
      """

  Scenario: No ordinals
    When I run `password_characters` interactively
    And I type "foobar"
    And I type ""
    Then it should fail with:
      """
      [] does not ask for any characters
      """

  Scenario: One ordinal
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1"
    Then it should fail with:
      """
      [1] only asks for one character
      """

  Scenario: Duplicate ordinals
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,1"
    Then it should fail with:
      """
      1 duplicated in [1, 1]
      """

  Scenario: Bounds of password
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "5,7"
    Then it should fail with:
      """
      7 out of bounds
      """

  Scenario: Subset
    When I run `password_characters` interactively
    And I type "foobar"
    And I type "1,2,3,4,5,6"
    Then it should fail with:
      """
      [1, 2, 3, 4, 5, 6] would reveal entire password
      """