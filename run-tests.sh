#!/bin/bash

#Todo: make script terminate as soon as error is hit
# Make sure the classpaths as well as the build.sbt file are updated correctly with each new project

#Colors!
RED='\033[0;31m'
NC='\033[0m' # No Color

# CLASSPATHS
CLASSPATHS="\
/Users/julian/.ivy2/cache/org.scala-lang/scala-library/jars/scala-library-2.12.3.jar\
:/Users/julian/.ivy2/cache/org.postgresql/postgresql/bundles/postgresql-42.2.2.jar\
:/Users/julian/.ivy2/cache/org.mariadb.jdbc/mariadb-java-client/jars/mariadb-java-client-2.1.2.jar\
:/Users/julian/.ivy2/cache/mysql/mysql-connector-java/jars/mysql-connector-java-8.0.12.jar\
:/Users/julian/.ivy2/cache/cool.graph/cuid-java/jars/cuid-java-0.1.1.jar\
:/Users/julian/.ivy2/cache/joda-time/joda-time/jars/joda-time-2.9.4.jar\
:/Users/julian/.ivy2/cache/org.joda/joda-convert/jars/joda-convert-1.7.jar\
:/Users/julian/.ivy2/cache/com.github.ben-manes.caffeine/caffeine/jars/caffeine-2.5.5.jar\
:/Users/julian/.ivy2/cache/com.google.code.findbugs/jsr305/jars/jsr305-3.0.0.jar\
:/Users/julian/.ivy2/cache/org.scalactic/scalactic_2.12/bundles/scalactic_2.12-3.0.4.jar\
:/Users/julian/.ivy2/cache/com.datadoghq/java-dogstatsd-client/jars/java-dogstatsd-client-2.3.jar\
:/Users/julian/.ivy2/cache/com.bugsnag/bugsnag/jars/bugsnag-3.0.2.jar\
:/Users/julian/.ivy2/cache/org.slf4j/slf4j-api/jars/slf4j-api-1.7.21.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-base-http_2.12/jars/finagle-base-http_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-core_2.12/jars/finagle-core_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-http2_2.12/jars/finagle-http2_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-http_2.12/jars/finagle-http_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-netty4-http_2.12/jars/finagle-netty4-http_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-netty4_2.12/jars/finagle-netty4_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-toggle_2.12/jars/finagle-toggle_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-app_2.12/jars/util-app_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-cache_2.12/jars/util-cache_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-codec_2.12/jars/util-codec_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-collection_2.12/jars/util-collection_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-core_2.12/jars/util-core_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-function_2.12/jars/util-function_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-hashing_2.12/jars/util-hashing_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-jvm_2.12/jars/util-jvm_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-lint_2.12/jars/util-lint_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-logging_2.12/jars/util-logging_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-registry_2.12/jars/util-registry_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-security_2.12/jars/util-security_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-stats_2.12/jars/util-stats_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-tunable_2.12/jars/util-tunable_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/commons-lang/commons-lang/jars/commons-lang-2.6.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.core/jackson-databind/bundles/jackson-databind-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.core/jackson-annotations/bundles/jackson-annotations-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.core/jackson-core/bundles/jackson-core-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.module/jackson-module-paranamer/bundles/jackson-module-paranamer-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.module/jackson-module-scala_2.12/bundles/jackson-module-scala_2.12-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.thoughtworks.paranamer/paranamer/bundles/paranamer-2.8.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-base-http_2.12/jars/finagle-base-http_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-core_2.12/jars/finagle-core_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-http2_2.12/jars/finagle-http2_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-http_2.12/jars/finagle-http_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-netty4-http_2.12/jars/finagle-netty4-http_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-netty4_2.12/jars/finagle-netty4_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/finagle-toggle_2.12/jars/finagle-toggle_2.12-6.44.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-app_2.12/jars/util-app_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-cache_2.12/jars/util-cache_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-codec_2.12/jars/util-codec_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-collection_2.12/jars/util-collection_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-core_2.12/jars/util-core_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-function_2.12/jars/util-function_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-hashing_2.12/jars/util-hashing_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-jvm_2.12/jars/util-jvm_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-lint_2.12/jars/util-lint_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-logging_2.12/jars/util-logging_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-registry_2.12/jars/util-registry_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-security_2.12/jars/util-security_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-stats_2.12/jars/util-stats_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/com.twitter/util-tunable_2.12/jars/util-tunable_2.12-6.43.0.jar\
:/Users/julian/.ivy2/cache/commons-lang/commons-lang/jars/commons-lang-2.6.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.core/jackson-databind/bundles/jackson-databind-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.core/jackson-annotations/bundles/jackson-annotations-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.core/jackson-core/bundles/jackson-core-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.module/jackson-module-paranamer/bundles/jackson-module-paranamer-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.fasterxml.jackson.module/jackson-module-scala_2.12/bundles/jackson-module-scala_2.12-2.8.4.jar\
:/Users/julian/.ivy2/cache/com.pauldijou/jwt-core-impl_2.12/jars/jwt-core-impl_2.12-0.14.1.jar\
:/Users/julian/.ivy2/cache/com.pauldijou/jwt-core_2.12/jars/jwt-core_2.12-0.14.1.jar\
:/Users/julian/.ivy2/cache/com.typesafe.play/play-json_2.12/jars/play-json_2.12-2.6.8.jar\
:/Users/julian/.ivy2/cache/org.scala-lang.modules/scala-java8-compat_2.12/bundles/scala-java8-compat_2.12-0.8.0.jar\
:/Users/julian/.ivy2/cache/com.typesafe.scala-logging/scala-logging_2.12/bundles/scala-logging_2.12-3.7.0.jar\
:/Users/julian/.ivy2/cache/ch.qos.logback/logback-classic/jars/logback-classic-1.1.7.jar\
:/Users/julian/.ivy2/cache/ch.qos.logback/logback-core/jars/logback-core-1.1.7.jar\
:/Users/julian/.ivy2/cache/org.scalaj/scalaj-http_2.12/jars/scalaj-http_2.12-2.3.0.jar\
:/Users/julian/.ivy2/cache/org.atteo/evo-inflector/jars/evo-inflector-1.2.jar\
:/Users/julian/.ivy2/cache/org.yaml/snakeyaml/bundles/snakeyaml-1.19.jar\
:/Users/julian/.ivy2/cache/org.bouncycastle/bcpkix-jdk15on/jars/bcpkix-jdk15on-1.57.jar\
:/Users/julian/.ivy2/cache/org.bouncycastle/bcprov-jdk15on/jars/bcprov-jdk15on-1.57.jar\
:/Users/julian/.ivy2/cache/com.typesafe/config/bundles/config-1.2.1.jar\
:/Users/julian/.ivy2/cache/com.zaxxer/HikariCP/bundles/HikariCP-2.5.1.jar\
:/Users/julian/.ivy2/cache/org.slf4j/slf4j-api/jars/slf4j-api-1.7.21.jar\
:/Users/julian/.ivy2/cache/org.slf4j/slf4j-api/jars/slf4j-api-1.7.25.jar\
:/Users/julian/.ivy2/cache/com.librato.metrics/librato-java/jars/librato-java-2.1.0.jar\
:/Users/julian/.ivy2/cache/org.eclipse.jetty/jetty-http/jars/jetty-http-9.3.0.v20150612.jar\
:/Users/julian/.ivy2/cache/org.eclipse.jetty/jetty-io/jars/jetty-io-9.3.0.v20150612.jar\
:/Users/julian/.ivy2/cache/org.eclipse.jetty/jetty-server/jars/jetty-server-9.3.0.v20150612.jar\
:/Users/julian/.ivy2/cache/org.eclipse.jetty/jetty-util/jars/jetty-util-9.3.0.v20150612.jar\
:/Users/julian/.ivy2/cache/javax.servlet/javax.servlet-api/jars/javax.servlet-api-3.1.0.jar\
:/Users/julian/.ivy2/cache/io.lemonlabs/scala-uri_2.12/jars/scala-uri_2.12-1.1.1.jar\
:/Users/julian/.ivy2/cache/org.parboiled/parboiled_2.12/jars/parboiled_2.12-2.1.4.jar\
:/Users/julian/.ivy2/cache/com.chuusai/shapeless_2.12/bundles/shapeless_2.12-2.3.3.jar\
:/Users/julian/.ivy2/cache/io.spray/spray-json_2.12/bundles/spray-json_2.12-1.3.3.jar\
:/Users/julian/.ivy2/cache/org.scala-lang.modules/scala-parser-combinators_2.12/bundles/scala-parser-combinators_2.12-1.0.4.jar\
:/Users/julian/.ivy2/cache/com.thoughtworks.paranamer/paranamer/bundles/paranamer-2.8.jar:"

# Project packages
postgres="/Users/julian/Projects/graal-compatibility/postgres/target/scala-2.12/postgres_2.12-0.1.0-SNAPSHOT.jar"
mariaDb="/Users/julian/Projects/graal-compatibility/mariaDb/target/scala-2.12/mariadb_2.12-0.1.0-SNAPSHOT.jar"
mysql="/Users/julian/Projects/graal-compatibility/mysql/target/scala-2.12/mysql_2.12-0.1.0-SNAPSHOT.jar"
other="/Users/julian/Projects/graal-compatibility/other/target/scala-2.12/other_2.12-0.1.0-SNAPSHOT.jar"
finagle="/Users/julian/Projects/graal-compatibility/finagle/target/scala-2.12/finagle_2.12-0.1.0-SNAPSHOT.jar"
slick="/Users/julian/Projects/graal-compatibility/slick/target/scala-2.12/slick_2.12-0.1.0-SNAPSHOT.jar"
jwt="/Users/julian/Projects/graal-compatibility/jwt/target/scala-2.12/jwt_2.12-0.1.0-SNAPSHOT.jar"
playJson="/Users/julian/Projects/graal-compatibility/play-json/target/scala-2.12/playjson_2.12-0.1.0-SNAPSHOT.jar"
java8Compat="/Users/julian/Projects/graal-compatibility/java8Compat/target/scala-2.12/java8compat_2.12-0.1.0-SNAPSHOT.jar"
scalaLogging="/Users/julian/Projects/graal-compatibility/scalaLogging/target/scala-2.12/scalalogging_2.12-0.1.0-SNAPSHOT.jar"
scalajHttp="/Users/julian/Projects/graal-compatibility/scalajHttp/target/scala-2.12/scalajhttp_2.12-0.1.0-SNAPSHOT.jar"
evoinflector="/Users/julian/Projects/graal-compatibility/evoInflector/target/scala-2.12/evoinflector_2.12-0.1.0-SNAPSHOT.jar"
snakeYML="/Users/julian/Projects/graal-compatibility/snakeYML/target/scala-2.12/snakeyml_2.12-0.1.0-SNAPSHOT.jar"
logstash="/Users/julian/Projects/graal-compatibility/logstash/target/scala-2.12/logstash_2.12-0.1.0-SNAPSHOT.jar"
librato="/Users/julian/Projects/graal-compatibility/librato/target/scala-2.12/librato_2.12-0.1.0-SNAPSHOT.jar"
jettyServer="/Users/julian/Projects/graal-compatibility/jettyServer/target/scala-2.12/jettyserver_2.12-0.1.0-SNAPSHOT.jar"
scalaUri="/Users/julian/Projects/graal-compatibility/scalaUri/target/scala-2.12/scalauri_2.12-0.1.0-SNAPSHOT.jar"
parserCombinators="/Users/julian/Projects/graal-compatibility/parserCombinators/target/scala-2.12/parsercombinators_2.12-0.1.0-SNAPSHOT.jar"

# TESTING
currentlyTesting=$parserCombinators

echo -e "${RED}Packaging...${NC}"
# sbt clean
sbt "package"
echo
echo -e "${RED}Building...${NC}"
rm -rf main
native-image --verbose -cp "$CLASSPATHS""$currentlyTesting" -H:Class=Main -H:+ReportUnsupportedElementsAtRuntime
echo
echo -e "${RED}Running...${NC}"
./main
echo
echo -e "${RED}Competed... ✅${NC}"
