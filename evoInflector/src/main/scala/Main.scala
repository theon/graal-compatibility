import org.atteo.evo.inflector.English

object Main {
  def main(args: Array[String]) = {
    println("evoInflector")

    println(English.plural("word", 2))
  }
}