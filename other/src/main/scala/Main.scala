import java.util.TimeZone
import java.util.concurrent.TimeUnit

import org.joda.convert.StringConvert
import org.joda.time.DateTime
import cool.graph.cuid._
import org.scalactic._
import TripleEquals._
import StringNormalizations._
import Explicitly._
import com.bugsnag._
import com.github.benmanes.caffeine.cache._
import com.timgroup.statsd._

//
//    jwt


object Main {
  def main(args: Array[String]) = {
    def p = (name: String, info: Any) => println(name+": "+info)

    println("Other is now running")

    // jodaTime
    val dt = new DateTime
    val month = dt.getMonthOfYear // where January is 1 and December is 12
    val year = dt.getYear
    p("jodaTime", month + year)

    // jodaConvert
    val zone: TimeZone = TimeZone.getTimeZone("America/Los_Angeles")
    val str: String = StringConvert.INSTANCE.convertToString(zone)
    p("jodaConvert: ", str)

    //cuid
    val cuid: String = Cuid.createCuid()
    p("cuid", cuid)

    //Scalactic
    p("Scalactic", ("Hello" === "hello") (after being lowerCased)) // true

    //Caffeine + Guava
    val graph = Caffeine.newBuilder()
      .maximumSize(10000)
      .expireAfterWrite(5, TimeUnit.MINUTES)
      .refreshAfterWrite(1, TimeUnit.MINUTES)
      .toString
    p("Caffeine + Guava", graph)

    //Statsd
    val statsd = new NonBlockingStatsDClient(
      "", /* prefix to any stats; may be null or empty string */
      "localhost", /* common case: localhost */
      8125, /* port */
      "tag:value" /* Datadog extension: Constant tags, always applied */
    )

    statsd.incrementCounter("foo")
    statsd.recordGaugeValue("bar", 100)
    statsd.recordGaugeValue("baz", 0.01) /* DataDog extension: support for floating-point gauges */
    statsd.recordHistogramValue("qux", 15) /* DataDog extension: histograms */
    statsd.recordHistogramValue("qux", 15.5) /* ...also floating-point */
    val sc = ServiceCheck.builder.withName("my.check.name").withStatus(ServiceCheck.Status.OK).build
    statsd.serviceCheck(sc) /* Datadog extension: send service check status */
    /* Compatibility note: Unlike upstream statsd, DataDog expects execution times to be a
         * floating-point value in seconds, not a millisecond value. This library
         * does the conversion from ms to fractional seconds.
         */ statsd.recordExecutionTime("bag", 25, "cluster:foo") /* DataDog extension: cluster tag */
    statsd.stop()
    p("statsd", statsd.toString())

    // Bugsnag
//    val bugsnag = new Bugsnag("")
//    println(bugsnag)

    println("Done..")
  }
}