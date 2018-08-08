name := "graal-compatibility"
scalaVersion := "2.12.3"

import Dependencies.{scalaLogging, _}
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
  .aggregate(mariaDb, postgres, mysql, slick, finagle, jwt, playJson, amqp, java8Compat, scalaLogging, scalajHttp, other)
  .settings(
    publish := { } // do not publish a JAR for the root project
  )