@announce
Feature: Password in call
  Scenario: Ask for password
    When I run `password_characters foobar 1 4 6`
    Then it should pass with:
      """
      f b r
      """