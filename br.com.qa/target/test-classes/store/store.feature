#Author: profricardo.moura@fiap.com.br

@store
Feature: Everything about your Store
  Descrição da feature

Background:
	Given path 'store'

  @addNewOrder
  Scenario: Add new order
    Given url UrlBase
    And path 'order'
    When request {  "id": 5,  "petId": 7,  "quantity": 1,  "shipDate": "2023-08-09T14:52:44.197Z",  "status": "placed",  "complete": true}
    And method POST
    Then status 200
 
