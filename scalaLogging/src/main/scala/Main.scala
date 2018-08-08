import com.typesafe.scalalogging.Logger

object Main {
  def main(args: Array[String]) = {
    println("Scala logger..")

    val logger = Logger("name")

    logger.debug("debugging..")
  }
}