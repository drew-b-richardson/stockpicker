Feature: Add new criteria

  As an Admin
  I want to Add new criterion
  So that I can use it in a scenario to rate stocks 

  Scenario:successfully add new criterion
    Given I am on the criterion index page
    When I follow "Add New Criterion"
    Then I should be on the New Criterion page
    When I fill in the following: 
      | Name                 |successful test name|
      | Url                  | url                  |
      | Xpath                | xpath|
    And I press "Save"
    Then I should be on the criterion index page
    And I should see "Criterion was successfully created."
    And I should see "successful test name"

