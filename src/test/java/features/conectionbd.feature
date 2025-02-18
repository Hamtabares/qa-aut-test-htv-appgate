# Created by htabares at 18/2/2025
Feature: Consultar base de datos PostgreSQL


  Background:
    * def ConnectToDB = Java.type('ConnectToDB')

  Scenario: Ejecutar consulta en PostgreSQL
    * def query = "SELECT id, name, status, phishing_detection FROM customers"
    * def result = ConnectToDB.executeQuery(query)
    * print result
