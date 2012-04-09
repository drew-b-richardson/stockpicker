Feature: Create a new scenario

  As a user
  I want to create a new scenario
  So that I can have a tool to rate stocks

  Background: criterion have been added to the DB #this happens before each test
  Given the following criterions exist:
    |name               | url       |  xpath   |
    |PEG                   | yahoo       |  some path    |
    |ROA                   | msn       |  some other path    |

  Scenario: create a new scenario and add it to the db
    Given I am on the scenario index page
    When I follow "Create a New Scenario"
    Then I should be on the new scenario page
    When I fill in "Name" with "scenario name"
    And I select "ROA" from "Criterion"
    And I select "Light" from "Weight"
    And I press "Save" 
    Then I should be on the scenario index page
    And I should see "scenario name"
    And I should see "Scenario was successfully created."

    Scenario: add and remove criterion when creating a new scenario
    Given I am on the new scenario page
    Then  I should see "Criterion #1"

