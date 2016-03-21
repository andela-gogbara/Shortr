Feature: Anonymous User

  I visit the site
  As an anonymous user
  I want to be able to shorten my long url

 Scenario: Anonymous user can shorten url
    Given that I am an anonymous user of the system

    When I visit the site
    And give a URL to the service

    Then I expect it to return a service shortened URL

  Scenario: Anonymous user can follow shortened url
    Given that I am an anonymous user of the system

    When I follow a service shortened URL

    Then I expect to be redirected to the original URL

  Scenario: Anonymous user can see most popular urls and when they were added
    Given that I am an anonymous user of the system

    When I visit the site

    Then I expect to see URLs sorted by popularity
    And I expect to see URLs sorted by how recently they were added
