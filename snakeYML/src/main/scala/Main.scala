import org.yaml.snakeyaml.Yaml
import scala.collection.JavaConverters._

object Main {
  def main(args: Array[String]) = {
    println("snakeYML..")

    import org.yaml.snakeyaml.Yaml
    val yaml = new Yaml
    val document =
      """key1: value1
        |key2: value2
      """.stripMargin

    val obj = yaml.load[java.util.Map[String, Any]](document).asScala
    println(obj.get("key1"))
    println(obj.get("key2"))
  }
}