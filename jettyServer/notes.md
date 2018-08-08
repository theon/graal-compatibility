#Passed

Works when the -H:+ReportUnsupportedElementsAtRuntime is included. Throws the following error when it is not:

```
    classlist:   8,018.97 ms
           (cap):   1,188.28 ms
           setup:   1,404.78 ms
    17:11:47.769 [ForkJoinPool-203-worker-2] DEBUG org.eclipse.jetty.util.log - Logging to Logger[org.eclipse.jetty.util.log] via org.eclipse.jetty.util.log.Slf4jLog
    17:11:47.770 [ForkJoinPool-203-worker-2] INFO org.eclipse.jetty.util.log - Logging initialized @23809963ms
    17:11:48.742 [ForkJoinPool-203-worker-6] DEBUG org.eclipse.jetty.http.PreEncodedHttpField - HttpField encoders loaded: [org.eclipse.jetty.http.Http1FieldPreEncoder@24d9c745]
    Detected unnecessary RecomputeFieldValue.ArrayBaseOffset com.oracle.svm.core.jdk.Target_java_nio_DirectByteBuffer.arrayBaseOffset substitution field for java.nio.DirectByteBuffer.arrayBaseOffset. The annotated field can be removed. This ArrayBaseOffset computation can be detected automatically. Use option -H:+UnsafeAutomaticSubstitutionsLogLevel=2 to print all automatically detected substitutions.
        analysis:   3,173.97 ms
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
    	at ch.qos.logback.classic.Logger.debug(Logger.java:494)
    	at org.slf4j.helpers.SubstituteLogger.debug(SubstituteLogger.java:133)
    	at org.eclipse.jetty.util.log.Slf4jLog.debug(Slf4jLog.java:89)
    	at org.eclipse.jetty.util.thread.ShutdownThread.run(ShutdownThread.java:139)
    	at com.oracle.svm.core.posix.thread.PosixJavaThreads.pthreadStartRoutine(PosixJavaThreads.java:238)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eposix_002ethread_002ePosixJavaThreads_002epthreadStartRoutine_0028com_002eoracle_002esvm_002ecore_002eposix_002ethread_002ePosixJavaThreads_0024ThreadStartData_0029(generated:0)

    Error: Processing image build request failed
```