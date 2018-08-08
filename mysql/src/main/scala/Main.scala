import java.sql.Connection
import com.mysql.cj.jdbc.Driver


object Main {
  def main(args: Array[String]) = {
    println("Mysql..")

    val dbDriver = new Driver

    val url: String = "jdbc:mysql://localhost:3306/mysql"
    val user: String = "root"
    val password: String = "prisma"

    var info = new java.util.Properties()

    if (user != null) info.put("user", user)
    if (password != null) {
      info.put("password", password);
    }

    println("Opening db connection")


    val connection = dbDriver.connect(url, info) //Problems start here!
    val result = connection.prepareStatement("SELECT 1;")

    println(result.execute())
  }
}