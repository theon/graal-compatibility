import com.rabbitmq.client.{BuiltinExchangeType, ConnectionFactory}

object Main {
  def main(args: Array[String]) = {
    println("Amqp..")

    //Throws error when run:

    //SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".

    //According to this: https://stackoverflow.com/questions/7421612/slf4j-failed-to-load-class-org-slf4j-impl-staticloggerbinder
    //I need to include another .jar for comptibility. Leaving for now.


    val factory = new ConnectionFactory
    val conn = factory.newConnection
    val channel = conn.createChannel

    channel.exchangeDeclare("test-exchange", BuiltinExchangeType.DIRECT, true)

    channel.close
    conn.close


  }
}