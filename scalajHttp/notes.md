#Failed

Does not support http protocol:

```
Exception in thread "main" com.oracle.svm.core.jdk.UnsupportedFeatureError: The URL protocol https is not currently supported. Supported URL protocols enabled by default: file. Additional supported URL protocols: http.
	at java.lang.Throwable.<init>(Throwable.java:265)
	at java.lang.Error.<init>(Error.java:70)
	at com.oracle.svm.core.jdk.UnsupportedFeatureError.<init>(UnsupportedFeatureError.java:31)
	at com.oracle.svm.core.jdk.Target_com_oracle_svm_core_util_VMError.unsupportedFeature(VMErrorSubstitutions.java:109)
	at com.oracle.svm.core.jdk.JavaNetSubstitutions.unsupported(JavaNetSubstitutions.java:143)
	at com.oracle.svm.core.jdk.JavaNetSubstitutions.getURLStreamHandler(JavaNetSubstitutions.java:132)
	at com.oracle.svm.core.jdk.Target_java_net_URL.getURLStreamHandler(JavaNetSubstitutions.java:57)
	at java.net.URL.<init>(URL.java:599)
	at java.net.URL.<init>(URL.java:490)
	at java.net.URL.<init>(URL.java:439)
	at scalaj.http.HttpRequest.exec(Http.scala:335)
	at scalaj.http.HttpRequest.asString(Http.scala:455)
	at Main$.main(Main.scala:6)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
```