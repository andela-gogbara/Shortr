Feature: Registered User

    I visit the site
    As a registered user
    I want to be able to view my shortened url

    Scenario: Registerd user can use vanity string
      Given that I am a registered user of the system

      When I visit the site
      And give a URL to the service and a vanity string

      Then I expect it to return a service shortened URL composed of the vanity string

    Scenario: Registered user can view list of shortened url
      Given that I am a registered user of the system

      When I visit the site
      And view my user page

      Then I am able to view a list of all my service shortened URLs
