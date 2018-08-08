import java.util.function._
import scala.compat.java8.FunctionConverters._

object Main {
  def main(args: Array[String]) = {
    println("java8Compat..")


    val foo: Int => Boolean = i => i > 7
    def testBig(ip: IntPredicate) = ip.test(9)
    println(testBig(foo.asJava))  // Prints true

    val bar = new UnaryOperator[String]{ def apply(s: String) = s.reverse }
    List("cod", "herring").map(bar.asScala)    // List("doc", "gnirrih")

    def testA[A](p: Predicate[A])(a: A) = p.test(a)
    println(testA(asJavaPredicate(foo))(4))  // Prints false

  }
}