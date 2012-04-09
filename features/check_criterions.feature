Feature: check validity of criterions

  As an Administrator
  I want to check that the criterions are all returning valid data
  So that I can be sure that the stock rating data is correct

  
  Scenario: it should show the correct values of each criterion
  Given I am on the check criterions page
  When I enter "CSCO" into "stock"
  And I press "Check Criterions"
  Then I should should see every criterion

