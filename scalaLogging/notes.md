#Semi Working

Works without an issue when the -H:+ReportUnsupportedElementsAtRuntime flag is included, when it is not, the following error is displayed:

```
classlist:   5,278.82 ms
       (cap):     669.66 ms
       setup:     830.72 ms
    analysis:   3,756.47 ms
error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Unsupported method java.security.ProtectionDomain.getCodeSource() is reachable: The declaring class of this element has been substituted, but this element is not present in the substitution class
To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
Detailed message:
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Unsupported method java.security.ProtectionDomain.getCodeSource() is reachable: The declaring class of this element has been substituted, but this element is not present in the substitution class
To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
Trace:
	at parsing ch.qos.logback.classic.spi.PackagingDataCalculator.getCodeLocation(PackagingDataCalculator.java:164)
Call path from entry point to ch.qos.logback.classic.spi.PackagingDataCalculator.getCodeLocation(Class):
	at ch.qos.logback.classic.spi.PackagingDataCalculator.getCodeLocation(PackagingDataCalculator.java:162)
	at ch.qos.logback.classic.spi.PackagingDataCalculator.calculateByExactType(PackagingDataCalculator.java:123)
	at ch.qos.logback.classic.spi.PackagingDataCalculator.populateFrames(PackagingDataCalculator.java:96)
	at ch.qos.logback.classic.spi.PackagingDataCalculator.calculate(PackagingDataCalculator.java:58)
	at ch.qos.logback.classic.spi.ThrowableProxy.calculatePackagingData(ThrowableProxy.java:142)
	at ch.qos.logback.classic.spi.LoggingEvent.<init>(LoggingEvent.java:122)
	at ch.qos.logback.classic.Logger.buildLoggingEventAndAppend(Logger.java:419)
	at ch.qos.logback.classic.Logger.filterAndLog_0_Or3Plus(Logger.java:383)
	at ch.qos.logback.classic.Logger.debug(Logger.java:482)
	at Main$.main(Main.scala:9)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)

Error: Processing image build request failed
```

This library depends on logback, maybe this could be contributing to the issue?