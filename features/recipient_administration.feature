@javascript
Feature: Recipient administration
  Scenario: User adds a recipient
    Given I am on the new recipient page
    When I create a new recipient
    Then I should be on the recipients list
    And I should see my new recipient listed
