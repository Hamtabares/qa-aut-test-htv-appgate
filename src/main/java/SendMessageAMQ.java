
import com.rabbitmq.client.*;

public class SendMessageAMQ {

    private final static String QUEUE_NAME = "testing.customer.query.is-customer-available";

    public static void sendMessage(String message) throws Exception {
       // String user = System.getProperty("user");
       // String pass = System.getProperty("pass");
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        factory.setUsername("admin");
        factory.setPassword("admin");



        try (Connection connection = factory.newConnection();
             Channel channel = connection.createChannel()) {

            channel.basicPublish("", QUEUE_NAME, null, message.getBytes());
            System.out.println("Mensaje enviado: '" + message + "'");
        }


    }
}