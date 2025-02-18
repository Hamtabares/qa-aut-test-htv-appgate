# Created by htabares at 18/2/2025
Feature: Pruebas sobre servicios de la cola amq
  como usuario de appgate deseo validar el funcionamiento de los servicio

  Background:
    * def config  = {url : #(urlSend), authorization: #(basic)  }
    And header authorization = config.authorization
    * def id = customer


  Scenario: Enviar un mensaje a la cola entrada usando la API REST de RabbitMQ
    Given url config.url
    * def body = read ('classpath:data/serviceSend.json')
    *  body.payload = "{\"customer\": \"CUSTOMER"+id+"\"}"
    And request karate.get('body')
    When method post
    Then status 200
    And match response.routed == true

  Scenario: Enviar un mensaje a la cola salida usando la API REST de RabbitMQ
    Given url config.url
    * def body = read ('classpath:data/serviceReceived.json')
    *  body.payload = "{\"customer\": \"CUSTOMER"+id+"\",\"isAvailable\": true }"
    And request karate.get('body')
    When method post
    Then status 200
    And match response.routed == true