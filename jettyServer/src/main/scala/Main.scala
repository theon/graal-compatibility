import org.eclipse.jetty.server.Server

object Main {
  def main(args: Array[String]) = {
    println("JettyServer..")

    val server = new Server(8080)
    server.start()
    server.join()

    println("Done")

  }
}