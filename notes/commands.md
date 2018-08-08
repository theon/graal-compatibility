**Flow for testing:**

In sbt:

project NAME

"package"



In shell:

native-image --verbose -cp /Users/julian/.ivy2/cache/org.scala-lang/scala-library/jars/scala-library-2.12.3.jar:postgres/target/scala-2.12/postgres_2.12-0.1.0-SNAPSHOT.jar -H:Class=Main -H:+ReportUnsupportedElementsAtRuntime (replacing the jars with the ones used in each library)

./main (run the binary, check the result)