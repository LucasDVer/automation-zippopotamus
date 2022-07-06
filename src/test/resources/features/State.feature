@State @smoke
Feature: Get location information of a city using country and state

  Scenario Outline: Get a successful response when sending a valid country, state and a city
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <country>, a <state> and a <city>
    Then The response status code should be 200
    And The response body should contains <state> as state abbreviation

    Examples:
      | country | state      |city       |
      | "us"    | "MA"       |"belmont"  |

  Scenario Outline: Get a unsuccessful response when sending a invalid country, a state and a city
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <invalidCountry>, a <state> and a <city>
    Then The response status code should be 404

    Examples:
      | invalidCountry | state      |city       |
      | "uus"          | "MA"       |"belmont"  |
      | "uss"          | "MA"       |"belmont"  |

  Scenario Outline: Get a unsuccessful response when sending a country, an invalid state and a city
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <country>, a <invalidState> and a <city>
    Then The response status code should be 404

    Examples:
      | country        | invalidState    |city       |
      | "us"           | "MMA"           |"belmont"  |
      | "us"           | "MaA"           |"belmont"  |

  Scenario Outline: Get a unsuccessful response when sending a country, an state and a invalid city
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <country>, a <state> and a <invalidCity>
    Then The response status code should be 404

    Examples:
      | country        | state          |invalidCity       |
      | "us"           | "MA"           |"belmont."        |
      | "us"           | "MA"           |""                |
      | "us"           | "MA"           |"belmt"           |

  Scenario Outline: Get a unsuccessful response when sending a invalid country, an invalid state and a city
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <invalidCountry>, a <invalidState> and a <city>
    Then The response status code should be 404

    Examples:
      | invalidCountry        | invalidState         |city       |
      | "uus"                 | "MAA"                |"belmont"  |
      | "uss"                 | "MMA"                |"belmont"  |
      | "us."                 | ".MA"                |"belmont"  |

  Scenario Outline: Get a unsuccessful response when sending a invalid country, an state and a invalid city
    Given The user has access to the zippopotamus endpoint
    When The user performs a GET request with a <invalidCountry>, a <state> and a <invalidCity>
    Then The response status code should be 404

    Examples:
      | invalidCountry        | state                 |invalidCity       |
      | "u"                   | "MA"                  |"elmont"          |
      | "uss"                 | "MA"                  |"belmon"          |
      | "uus"                 | "MA"                  |""                |

  Scenario Outline: Get a unsuccessful response when sending a country, an invalid state and a invalid city
    Given The user has access to the zippopotamus endpoint
    When  The user performs a GET request with a <country>, a <invalidState> and a <invalidCity>
    Then  The response status code should be 404

    Examples:
      | country               | invalidState           |invalidCity      |
      | "us"                  | "M"                    |"bbelmont"       |
      | "us"                  | ".A"                   |"belmontt"       |
      | "us"                  | "MA"                   |"blmont"         |
      | "us"                  | "MAA"                  |""               |

  Scenario Outline: Get a unsuccessful response when sending a invalid country, an invalid state and a invalid city
    Given The user has access to the zippopotamus endpoint
    When  The user performs a GET request with a <invalidCountry>, a <invalidState> and a <invalidCity>
    Then  The response status code should be 404

    Examples:
      | invalidCountry       | invalidState          |invalidCity       |
      | "u"                  | "M"                   |"belmontt"        |
      | "uss"                | "AM"                  |"elmon"           |
      | "s"                  | "MM"                  |""                |

