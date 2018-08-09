name := "graal-compatibility"
scalaVersion := "2.12.3"

import Dependencies.{scalaLogging, _}
import sbt.Keys.managedDirectory

val dependencies = taskKey[Seq[File]]("copy dependencies")
def myProject(name: String) = Project(name, file(s"./$name")).settings(
  managedDirectory := target.value / "lib_managed",
  dependencies := {
    val baseDir = baseDirectory.value
    val managedDir = managedDirectory.value
    dependencyClasspath.in(Compile).value.toVector.flatMap { dep =>
      dep.data.relativeTo(baseDir).orElse {
        // For some reason sbt sometimes decides to use the scala-library from `~/.sbt/boot` (which is outside of the project dir)
        // As a workaround we copy the file in lib_managed and use the copy instead (shouldn't cause name collisions)
        val inManaged = managedDir / dep.data.name
        IO.copy(Seq(dep.data → inManaged))
        inManaged.relativeTo(baseDir)
      }
    }
  }
)


val postgres = myProject("postgres").settings(libraryDependencies ++= Seq(
  postgresClient
))

val mariaDb = Project("mariaDb", file("./mariaDb")).settings(libraryDependencies ++= Seq(
  mariaDbClient
))

val mysql = Project("mysql", file("./mysql")).settings(libraryDependencies ++= Seq(
  mysqlClient
))

val slick = Project("slick", file("./slick")).settings(libraryDependencies ++= Dependencies.slick ++ Seq(
  postgresClient
))

val finagle = Project("finagle", file("./finagle")).settings(libraryDependencies ++= Seq(
  Dependencies.finagle
))

val jwt = Project("jwt", file("./jwt")).settings(libraryDependencies ++= Seq(
  Dependencies.jwt
))

val playJson = Project("playJson", file("./play-json")).settings(libraryDependencies ++= Seq (
  Dependencies.playJson
))

val amqp = Project("amqp", file("./amqp")).settings(libraryDependencies ++= Seq (
  Dependencies.amqp
))

val java8Compat = Project("java8Compat", file("./java8Compat")).settings(libraryDependencies ++= Seq (
  Dependencies.java8Compat
))


val scalaLogging = Project("scalaLogging", file("./scalaLogging")).settings(libraryDependencies ++= Seq (
  Dependencies.scalaLogging,
  logBack
))

val scalajHttp = Project("scalajHttp", file("./scalajHttp")).settings(libraryDependencies ++= Seq (
  Dependencies.scalajHttp
))

val evoInflector = Project("evoInflector", file("./evoInflector")).settings(libraryDependencies ++= Seq (
  Dependencies.evoInflector
))

val snakeYML = Project("snakeYML", file("./snakeYML")).settings(libraryDependencies ++= Seq (
  Dependencies.snakeYML,
  Dependencies.java8Compat
))

val logstash = Project("logstash", file("./logstash")).settings(libraryDependencies ++= Seq (
  Dependencies.logstash
))

val librato = Project("librato", file("./librato")).settings(libraryDependencies ++= Seq (
  Dependencies.librato,
  Dependencies.logBack
))

val jettyServer = Project("jettyServer", file("./jettyServer")).settings(libraryDependencies ++= Seq (
  Dependencies.jettyServer
))

val scalaUri = Project("scalaUri", file("./scalaUri")).settings(libraryDependencies ++= Seq (
  Dependencies.scalaUri
))

val parserCombinators = Project("parserCombinators", file("./parserCombinators")).settings(libraryDependencies ++= Seq (
  Dependencies.parserCombinators
))

val akka = Project("akka", file("./akka")).settings(libraryDependencies ++= Seq (
  Dependencies.akka
))

val other = Project("other", file("./other")).settings(libraryDependencies ++= Seq(
  jodaTime,
  jodaConvert,

  cuid,
  scalactic,

  jsr305,
  caffeine,

  guava,
  datadogStatsd,

  bugsnagClient
))

lazy val root = (project in file("."))
  .aggregate(
    mariaDb,
    postgres,
    mysql,
    slick,
    finagle,
    jwt,
    playJson,
    amqp,
    java8Compat,
    scalaLogging,
    scalajHttp,
    evoInflector,
    snakeYML,
    logstash,
    librato,
    jettyServer,
    scalaUri,
    parserCombinators,
    akka,
    other
  ).dependsOn(
    mariaDb,
    postgres,
    mysql,
    slick,
    finagle,
    jwt,
    playJson,
    amqp,
    java8Compat,
    scalaLogging,
    scalajHttp,
    evoInflector,
    snakeYML,
    logstash,
    librato,
    jettyServer,
    scalaUri,
    parserCombinators,
    akka,
    other
  )
  .settings(
    publish := { }, // do not publish a JAR for the root project
    managedDirectory := target.value / "lib_managed",
    dependencies := {
      val baseDir = baseDirectory.value
      val managedDir = managedDirectory.value
      dependencyClasspath.in(Compile).value.toVector.flatMap { dep =>
        dep.data.relativeTo(baseDir).orElse {
          // For some reason sbt sometimes decides to use the scala-library from `~/.sbt/boot` (which is outside of the project dir)
          // As a workaround we copy the file in lib_managed and use the copy instead (shouldn't cause name collisions)
          val inManaged = managedDir / dep.data.name
          IO.copy(Seq(dep.data → inManaged))
          inManaged.relativeTo(baseDir)
        }
      }
    }
  )