Feature: como administrador de rabbit quiero validar conexión a la cola RabbitMQ
  para leer mensajes encolados

  @sendMessage
  Scenario: Enviar un mensaje a RabbitMQ usando Java
    Given def message = read ('classpath:data/sendMessage.json')
    * def message = karate.toString(message)
    When def rabbitSender = Java.type('SendMessageAMQ')
    Then def result = rabbitSender.sendMessage(message)

  @receivedMessage
  Scenario: leer mensaje de RabbitMQ usando Java
    Given def message = read ('classpath:data/receivedMessage.json')
    * def message = karate.toString(message)
    When def rabbitReceived = Java.type('ReceiverMessageAMQ')
    Then def result = rabbitReceived.receiveMessage(message)

