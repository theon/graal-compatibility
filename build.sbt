name := "graal-compatibility"
scalaVersion := "2.12.3"

import Dependencies.{scalaLogging, _}

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