import java.util.logging.{Level, Logger}

import net.logstash.logback.argument.StructuredArguments._


object Main {
  def main(args: Array[String]) = {
    println("Logstash..")
    val log: Logger = Logger.getAnonymousLogger
    log.log(Level.ALL, "Test log")
  }
}