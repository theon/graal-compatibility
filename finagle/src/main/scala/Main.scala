import java.util.concurrent.TimeUnit

import com.twitter.finagle.{Http, Service}
import com.twitter.finagle.http
import com.twitter.util.{Await, Duration, Future, Time}


//    jsr305,

//    finagle,
//    guava,
//    datadogStatsd,
//
//    bugsnagClient,
//
//    jwt


object Main {
  def main(args: Array[String]) = {
    def p = (name: String, info: Any) => println(name+": "+info)

    println("Finagle is now running")

    //Finagle
    val service = new Service[http.Request, http.Response] {
      def apply(req: http.Request): Future[http.Response] =
        Future.value(
          http.Response(req.version, http.Status.Ok)
        )
    }
    val server = Http.serve(":8080", service)
//    Await.ready(server)
//    server.close(Duration(1, TimeUnit.SECONDS))


    println("Done..")
  }
}