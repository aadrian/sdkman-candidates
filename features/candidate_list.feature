Feature: Candidate List

  Scenario: Render a detailed List of Candidates
    Given the Candidates
      | candidate | name      | description           | default   | websiteUrl                    | distribution   |
      | scala     | Scala     | The Scala Language    | 2.12.0    | http://www.scala-lang.org/    | UNIVERSAL      |
      | groovy    | Groovy    | The Groovy Language   | 2.4.7     | http://www.groovy-lang.org/   | UNIVERSAL      |
      | java      | Java      | The Java Language     | 8u111     | https://www.oracle.com        | MULTI_PLATFORM |

    When a request is made to the /candidates/list endpoint
    Then a 200 status code is received
    And the rendered text is:
    """
      |
      |================================================================================
      |Available Candidates
      |================================================================================
      |q-quit                                  /-search down
      |j-down                                  ?-search up
      |k-up                                    h-help
      |
      |--------------------------------------------------------------------------------
      |Groovy (2.4.7)                                       http://www.groovy-lang.org/
      |
      |The Groovy Language
      |
      |                                                            $ sdk install groovy
      |--------------------------------------------------------------------------------
      |Java (8u111)                                              https://www.oracle.com
      |
      |The Java Language
      |
      |                                                              $ sdk install java
      |--------------------------------------------------------------------------------
      |Scala (2.12.0)                                        http://www.scala-lang.org/
      |
      |The Scala Language
      |
      |                                                             $ sdk install scala
      |--------------------------------------------------------------------------------
      |
    """