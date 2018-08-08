import java.sql.Connection
import org.postgresql.Driver

object Main {
  def main(args: Array[String]) = {
    println("Postgres ssss")

    val url: String = "jdbc:postgresql://localhost:5432/postgres"
    val user: String = "postgres"
    val password: String = "prisma"

    val dbDriver = new org.postgresql.Driver

    val info = new java.util.Properties();

    if (user != null) {
      info.put("user", user);
    }
    if (password != null) {
      info.put("password", password);
    }

    val connection = dbDriver.connect(url, info)
    val result = connection.prepareStatement("SELECT 1;")

    println(result.execute())
  }
}