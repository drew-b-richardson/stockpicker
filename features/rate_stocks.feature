Feature: Rate a set of stocks based on a selected scenario

  As a User
  I want to Rate a set of stock symbols
  So that I can find the best stock to buy  

  Background: scenarios have been added to the DB #this happens before each test
  When the following scenarios exist:
  |name               |
  |scenario1            |
  |scenario2            |

  Scenario: when I enter stocks and press rate I should see the list of stocks
  Given I am on the rate stocks page
  When I fill in "stocks" with "CSCO QCOM ARLP" 
  And I select "scenario1" from "scenarios"
  And I press "Rate"
  Then I should see "CSCO" in Results div


