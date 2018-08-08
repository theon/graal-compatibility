import java.util.concurrent.TimeUnit._
import com.librato.metrics.client._
import org.slf4j.LoggerFactory

object Main {
  def main(args: Array[String]) = {
    println("Librato..")

    val client: LibratoClient = LibratoClient.builder("test@prisma.io", "api-token-12345")
      // these are optional
      .setConnectTimeout(new Duration(5, SECONDS))
      .setReadTimeout(new Duration(5, SECONDS))
      .setAgentIdentifier("my app name")
      // and finally build
      .build();

    print("Done")
  }
}