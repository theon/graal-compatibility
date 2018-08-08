import io.lemonlabs.uri.Url

object Main {
  def main(args: Array[String]) = {
    println("scalaUri..")

    val url = Url.parse("https://www.scala-lang.org")

    println(url.subdomain)

  }
}