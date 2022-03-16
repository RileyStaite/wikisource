Feature: Navbar functions

Scenario: Enter a URL into navbar
    Given I receive a URL
    When I verify the URL is a wikipedia article
    Then I display the sources from that article