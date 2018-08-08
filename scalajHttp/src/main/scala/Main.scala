import scalaj.http._

object Main {
  def main(args: Array[String]) = {

    val response: HttpResponse[String] = Http("https://jsonplaceholder.typicode.com/todos/1").asString

    println (response.body)
    println (response.code)
    println (response.headers)
    println (response.cookies)
  }
}