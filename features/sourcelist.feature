Feature: Listing of sources

I list the sorted sources from the wikipedia article

Scenario: List sources from article 
    Given Navbar receives wikipedia article
    When I list the sources
    And Sources have subtitles
    Then I display the sources categorized by subtitles

Scenario: 