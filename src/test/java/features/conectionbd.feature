# Created by htabares at 18/2/2025
Feature: Consultar base de datos PostgreSQL


  Background:
    * def ConnectToDB = Java.type('ConnectToDB')

  @checkCustomers
  Scenario: Ejecutar consulta en PostgreSQL
    * def query = "SELECT id, name, status, phishing_detection FROM customers"
    * def result = ConnectToDB.executeQuery(query)
    * print result

  @checkCustomer3
  Scenario: Ejecutar consulta en por cliente
    * def query = "SELECT id, name, status, phishing_detection FROM customers where name = 'CUSTOMER3'"
    * def result = ConnectToDB.executeQuery(query)
    * def status = result[0].status
    * print "El status del cliente es:", status
    And match result[0].status == false
    And match result[0].phishing_detection == true


  @checkCustomer1
  Scenario: Ejecutar consulta en por cliente
    * def query = "SELECT id, name, status, phishing_detection FROM customers where name = 'CUSTOMER1'"
    * def result = ConnectToDB.executeQuery(query)
    * def status = result[0].status
    * print "El status del cliente es:", status
    And match result[0].status == true
    And match result[0].phishing_detection == false
