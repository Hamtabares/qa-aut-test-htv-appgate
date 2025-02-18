
import com.rabbitmq.client.*;

public class ReceiverMessageAMQ {

    private final static String QUEUE_NAME = "testing.customer.response.is-customer-available";

    public static String receiveMessage(String message) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        factory.setUsername("admin");
        factory.setPassword("admin");

        try (Connection connection = factory.newConnection();
             Channel channel = connection.createChannel()) {

            channel.basicPublish("", QUEUE_NAME, null, message.getBytes());
            GetResponse response = channel.basicGet(QUEUE_NAME, true);
            if (response != null) {
                return new String(response.getBody(), "UTF-8");
            } else {
                return "No messages available";
            }
        }
    }
}
