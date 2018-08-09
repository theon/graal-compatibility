#!/bin/bash

# PROJECT PACKAGES
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

#projects=($postres $mariaDb $mysql $other $finagle $slick $jwt $playJson $java8Compat $scalaLogging $scalajHttp $evoInflector $snakeYML $logstash $librato $jettyServer $scalaUri $parserCombinators)
projects=($librato $jettyServer)

# UTILS

################################################################################
# from https://unix.stackexchange.com/questions/43340/how-to-introduce-timeout-for-shell-scripting
# Executes command with a timeout
# Params:
#   $1 timeout in seconds
#   $2 command
# Returns 1 if timed out 0 otherwise
timeout() {

    time=$1

    # start the command in a subshell to avoid problem with pipes
    # (spawn accepts one command)
    command="/bin/sh -c \"$2\""

    expect -c "set echo \"-noecho\"; set timeout $time; spawn -noecho $command; expect timeout { exit 1 } eof { exit 0 }"

    if [ $? = 1 ] ; then
        echo "Timeout after ${time} seconds"
    fi

}

print () {
  #Colors!
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  echo -e "${RED}$1${NC}"
}

contains-element () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

check-project () {
  currentlyTesting=$1
  CLASSPATHS=$2

  print "Building..."
  rm -rf main
  rm-rf results.txt
  native-image --verbose -cp "$CLASSPATHS""$currentlyTesting" -H:Class=Main -H:+ReportUnsupportedElementsAtRuntime | tee -a results.txt
  echo
  print "Running..."
  timeout 10 "./main | tee -a results.txt"
  echo
}

check-all-projects () {
  CLASSPATHS=$1

  for project in ${projects[@]}; do
    echo $project
    echo $CLASSPATHS
    check-project $project $CLASSPATHS
  done
}

# START ################################################################

# SBT PREP
print "Packaging..."
sbt "clean"
sbt "package"
echo

# GENERATE CLASSPATHS
print "Generating classpaths... "
sbt "dependencies"

target='target/lib_managed/'
classpaths=""
for file in $target*; do
  echo ${file##*/}
  classpaths="$classpaths$target${file##*/}:"
done

# RUN TESTS
project=$1
# if [contains-element "$project" "${projects[@]}"]; then
#   check-project "/Users/julian/Projects/graal-compatibility/librato/target/scala-2.12/librato_2.12-0.1.0-SNAPSHOT.jar" $classpaths
# fi

# [ $2 == 'yes' ]

if [ $project = 'all' ]; then
  print "Testing all projects..."
  check-all-projects $classpaths
fi

# check-project "/Users/julian/Projects/graal-compatibility/librato/target/scala-2.12/librato_2.12-0.1.0-SNAPSHOT.jar" $classpaths

print "Competed in $SECONDS ✅"