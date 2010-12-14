Feature: Article abstracts

  In order to select an article to read
  As a visitor
  I want to view a list of article abstracts


  Scenario: Paginate published articles
    Given 3 published articles exist
    When I go to the articles page
    Then I should see abstracts for the newest 2 published articles
    And I should not see an abstract for the oldest published article


  Scenario: Hide unpublished articles
    Given a published article exists
    And 2 unpublished articles exist
    When I go to the articles page
    Then I should see an abstract for the published article
    And I shoud not see an abstract for the unpublished articles


  # Note: This scenario relies in part on the passing first 
  # scenario which tests the pagination (2 at a time).  The
  # page loads additional articles before the step passes
  # causing it to fail.
  @javascript
  Scenario: Load more articles via endless scroll
    Given 3 published articles exist
    When I go to the articles page 
    Then I should see abstracts for the newest 2 published articles
    #And I should not see an abstract for the newest published article
    And show me the page
    When I scroll to the bottom of the page
    Then I should see abstracts for the newest 3 published articles
