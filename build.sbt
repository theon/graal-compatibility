name := "graal-compatibility"
scalaVersion := "2.12.3"

import Dependencies._

val postgres = Project("postgres", file("./postgres")).settings(libraryDependencies ++= Seq(
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
  .aggregate(mariaDb, postgres, mysql, slick, finagle, jwt, playJson, other)
  .settings(
    publish := { } // do not publish a JAR for the root project
  )