import com.typesafe.config.ConfigFactory
import slick.jdbc.PostgresProfile.api._

import scala.concurrent.Await

object Main {
  def main(args: Array[String]) = {
    println("Running slick example..")

    val config = ConfigFactory
      .parseString(s"""
                      |database {
                      |  dataSourceClass = "slick.jdbc.DriverDataSource"
                      |  properties {
                      |    url = "jdbc:postgresql://localhost:5432/postgres?currentSchema=public"
                      |    user = "user"
                      |    password = "password"
                      |  }
                      |  numThreads = 1 // we subtract 1 because one connection is consumed already by deploy
                      |  connectionTimeout = 5000
                      |}
      """.stripMargin)
      .resolve
    val dbDriver = new org.postgresql.Driver
    val db = Database.forConfig("database", config, driver = dbDriver)

    val action = SimpleDBIO {ctx =>
      val result = ctx.connection.prepareStatement("SELECT 1;")
      println(result.execute())
    }

    val result = db.run(action)
    import scala.concurrent.duration._
    println(Await.result(result, 5.seconds))
  }
}