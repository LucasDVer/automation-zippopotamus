@PostalCode @smoke
Feature: Get location information of a city using country and postal code

  Scenario Outline: Get a successful response when sending a valid postal code and a valid country
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <country> and <postalCode>
    Then The response status code should be 200
    And The response body should contains <postalCode> as postal code

    Examples:
      | country | postalCode |
      | "us"    | "90210"    |
      | "hr"    | "10000"    |
      | "at"    | "1010"     |
      | "ar"    | "3500"     |

  Scenario Outline: Get a unsuccessful response when sending a invalid postal code and a valid country
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <invalidCountry> and <postalCode>
    Then The response status code should be 404

    Examples:
      | invalidCountry | postalCode |
      | "us1"          | "90210"    |
      | "1us"          | "90210"    |
      | "uss"          | "90210"    |
      | "u s"          | "90210"    |
      | "20a"          | "90210"    |
      | "20a"          | "90210"    |
      | "u65"          | "10000"    |
      | "a5p"          | "1010"     |
      | "2r5"          | "3500"     |
      | ""          | "3500"     |


  Scenario Outline: Get a unsuccessful response when sending a  postal code and a invalid country
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <country> and <invalidPostalCode>
    Then The response status code should be 404

    Examples:
      | country | invalidPostalCode |
      | "us"    | "902100"          |
      | "at"    | "1011"            |
      | "us"    | "902100a"         |
      | "us"    | "a902100"         |
      | "us"    | "a"               |
      | "us"    | "9as_9"           |
      | "hr"    | "@85%^*6"         |
      | "us"    | ""                |


  Scenario Outline: Get a unsuccessful response when sending a invalid postal code and a invalid country
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <invalidCountry> and <invalidPostalCode>
    Then The response status code should be 404

    Examples:
      | invalidCountry | invalidPostalCode |
      | "20a"          | "9as_9"           |
      | "u65"          | "@85%^6"          |
      | "a5p"          | "18/*"            |
      | "2r5"          | "+9*0"            |



