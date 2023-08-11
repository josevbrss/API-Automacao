#Author: profricardo.moura@fiap.com.br

@pet
Feature: Everything about your Pets
  Descrição da feature

Background:
	Given path 'pet'

  @petByStatus
  Scenario: Finds Pets by status
    Given url UrlBase
    And path 'findByStatus'
    And param status = 'available'
    When method GET
    Then status 200
    And match response[0].name contains 'doggie'

  @petById1
  Scenario: Finds Pets by id succeed
    Given url UrlBase
    And path '9223372036854303829'
    When method GET
    Then status 200
    And match response.name contains 'doggie'
    
  @petById2
  Scenario: Finds Pets by id error
    Given url UrlBase
    And path '-111'
    When method GET
    Then status 400
    And match response.message contains 'Invalid ID supplied'
    
   @addNewPet1
   Scenario: add new pet
	   Given url UrlBase
	   When request {  "id": 4,  "category": {    "id": 0,    "name": "string"  },  "name": "Henry noguei",  "photoUrls": [    "string"  ],  "tags": [    {      "id": 0,      "name": "string"    }  ],  "status": "available"}
	   And method POST
	   Then status 200
	   
	@addNewPet2
    Scenario: add new pet
	   Given url UrlBase
	   When request {  "error": "thinas" }
	   And method POST
	   Then status 405
	   And match response.message contains 'Invalid input'
 