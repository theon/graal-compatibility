Jodatime is not finding the timezone related resources despite them being located inside the jar as indicated by the error below:
```
java.io.IOException: Resource not found: "org/joda/time/tz/data/Europe/Berlin" ClassLoader: java.lang.ClassLoader@103a534b0
	at java.lang.Throwable.<init>(Throwable.java:265)
	at java.lang.Exception.<init>(Exception.java:66)
	at java.io.IOException.<init>(IOException.java:58)
	at org.joda.time.tz.ZoneInfoProvider.openResource(ZoneInfoProvider.java:216)
	at org.joda.time.tz.ZoneInfoProvider.loadZoneData(ZoneInfoProvider.java:231)
	at org.joda.time.tz.ZoneInfoProvider.getZone(ZoneInfoProvider.java:162)
	at org.joda.time.DateTimeZone.forTimeZone(DateTimeZone.java:354)
	at org.joda.time.DateTimeZone.getDefault(DateTimeZone.java:157)
	at org.joda.time.chrono.ISOChronology.getInstance(ISOChronology.java:79)
	at org.joda.time.base.BaseDateTime.<init>(BaseDateTime.java:61)
	at org.joda.time.DateTime.<init>(DateTime.java:171)
	at Main$.main(Main.scala:29)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
```

Bugsnag not seeming to work because of static stuff and a load of dependencies on org.slf4j.impl.StaticLoggerBinder, seen below:
```
    classlist:   6,202.31 ms
          (cap):   1,142.89 ms
          setup:   1,393.17 ms
   SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
   SLF4J: Defaulting to no-operation (NOP) logger implementation
   SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
   Detected unnecessary RecomputeFieldValue.ArrayBaseOffset com.oracle.svm.core.jdk.Target_java_nio_DirectByteBuffer.arrayBaseOffset substitution field for java.nio.DirectByteBuffer.arrayBaseOffset. The annotated field can be removed. This ArrayBaseOffset computation can be detected automatically. Use option -H:+UnsafeAutomaticSubstitutionsLogLevel=2 to print all automatically detected substitutions.
       analysis:   2,979.56 ms
   error: Error loading a referenced type: java.lang.NoClassDefFoundError: javax/servlet/ServletRequestListener
   Detailed message:
   Error: Error loading a referenced type: java.lang.NoClassDefFoundError: javax/servlet/ServletRequestListener
   Trace:
   	at parsing com.bugsnag.callbacks.ServletCallback.beforeNotify(ServletCallback.java:30)
   Call path from entry point to com.bugsnag.callbacks.ServletCallback.beforeNotify(Report):
   	at com.bugsnag.callbacks.ServletCallback.beforeNotify(ServletCallback.java:30)
   	at com.bugsnag.Bugsnag.notify(Bugsnag.java:330)
   	at com.bugsnag.Bugsnag.notify(Bugsnag.java:280)
   	at com.bugsnag.Bugsnag.notify(Bugsnag.java:260)
   	at com.bugsnag.ExceptionHandler.uncaughtException(ExceptionHandler.java:48)
   	at com.oracle.svm.core.thread.JavaThreads.dispatchUncaughtException(JavaThreads.java:485)
   	at com.oracle.svm.core.posix.thread.PosixJavaThreads.pthreadStartRoutine(PosixJavaThreads.java:240)
   	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eposix_002ethread_002ePosixJavaThreads_002epthreadStartRoutine_0028com_002eoracle_002esvm_002ecore_002eposix_002ethread_002ePosixJavaThreads_0024ThreadStartData_0029(generated:0)
   Original exception that caused the problem: java.lang.NoClassDefFoundError: javax/servlet/ServletRequestListener
   	at java.lang.ClassLoader.defineClass1(Native Method)
   	at java.lang.ClassLoader.defineClass(ClassLoader.java:763)
   	at java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)
   	at java.net.URLClassLoader.defineClass(URLClassLoader.java:467)
   	at java.net.URLClassLoader.access$100(URLClassLoader.java:73)
   	at java.net.URLClassLoader$1.run(URLClassLoader.java:368)
   	at java.net.URLClassLoader$1.run(URLClassLoader.java:362)
   	at java.security.AccessController.doPrivileged(Native Method)
   	at java.net.URLClassLoader.findClass(URLClassLoader.java:361)
   	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
   	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
   	at jdk.vm.ci.hotspot.CompilerToVM.resolveTypeInPool(Native Method)
   	at jdk.vm.ci.hotspot.HotSpotConstantPool.loadReferencedType(HotSpotConstantPool.java:696)
   	at com.oracle.graal.pointsto.infrastructure.WrappedConstantPool.loadReferencedType(WrappedConstantPool.java:60)
   	at org.graalvm.compiler.java.BytecodeParser.maybeEagerlyResolve(BytecodeParser.java:3971)
   	at com.oracle.svm.hosted.phases.SharedGraphBuilderPhase$SharedBytecodeParser.maybeEagerlyResolve(SharedGraphBuilderPhase.java:99)
   	at org.graalvm.compiler.java.BytecodeParser.lookupMethod(BytecodeParser.java:3925)
   	at org.graalvm.compiler.java.BytecodeParser.genInvokeStatic(BytecodeParser.java:1422)
   	at com.oracle.svm.hosted.phases.SharedGraphBuilderPhase$SharedBytecodeParser.genInvokeStatic(SharedGraphBuilderPhase.java:168)
   	at org.graalvm.compiler.java.BytecodeParser.processBytecode(BytecodeParser.java:4850)
   	at org.graalvm.compiler.java.BytecodeParser.iterateBytecodesForBlock(BytecodeParser.java:3135)
   	at org.graalvm.compiler.java.BytecodeParser.processBlock(BytecodeParser.java:2944)
   	at org.graalvm.compiler.java.BytecodeParser.build(BytecodeParser.java:888)
   	at org.graalvm.compiler.java.BytecodeParser.buildRootMethod(BytecodeParser.java:782)
   	at org.graalvm.compiler.java.GraphBuilderPhase$Instance.run(GraphBuilderPhase.java:95)
   	at org.graalvm.compiler.phases.Phase.run(Phase.java:49)
   	at org.graalvm.compiler.phases.BasePhase.apply(BasePhase.java:197)
   	at org.graalvm.compiler.phases.Phase.apply(Phase.java:42)
   	at org.graalvm.compiler.phases.Phase.apply(Phase.java:38)
   	at com.oracle.graal.pointsto.flow.MethodTypeFlowBuilder.parse(MethodTypeFlowBuilder.java:196)
   	at com.oracle.graal.pointsto.flow.MethodTypeFlowBuilder.apply(MethodTypeFlowBuilder.java:315)
   	at com.oracle.graal.pointsto.flow.MethodTypeFlow.doParse(MethodTypeFlow.java:310)
   	at com.oracle.graal.pointsto.flow.MethodTypeFlow.ensureParsed(MethodTypeFlow.java:300)
   	at com.oracle.graal.pointsto.flow.MethodTypeFlow.addContext(MethodTypeFlow.java:107)
   	at com.oracle.graal.pointsto.DefaultAnalysisPolicy$DefaultVirtualInvokeTypeFlow.onObservedUpdate(DefaultAnalysisPolicy.java:186)
   	at com.oracle.graal.pointsto.flow.TypeFlow.notifyObservers(TypeFlow.java:347)
   	at com.oracle.graal.pointsto.flow.TypeFlow.update(TypeFlow.java:389)
   	at com.oracle.graal.pointsto.BigBang$2.run(BigBang.java:502)
   	at com.oracle.graal.pointsto.util.CompletionExecutor.lambda$execute$0(CompletionExecutor.java:174)
   	at java.util.concurrent.ForkJoinTask$RunnableExecuteAction.exec(ForkJoinTask.java:1402)
   	at java.util.concurrent.ForkJoinTask.doExec(ForkJoinTask.java:289)
   	at java.util.concurrent.ForkJoinPool$WorkQueue.runTask(ForkJoinPool.java:1056)
   	at java.util.concurrent.ForkJoinPool.runWorker(ForkJoinPool.java:1692)
   	at java.util.concurrent.ForkJoinWorkerThread.run(ForkJoinWorkerThread.java:157)
   Caused by: java.lang.ClassNotFoundException: javax.servlet.ServletRequestListener
   	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
   	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
   	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
   	... 44 more

   Error: Processing image build request failed
```