#Error

Depite running on the postgres driver, slick fails to work.

This error is thrown when the -H:+ReportUnsupportedElementsAtRuntime is included
```
    Exception in thread "main" com.oracle.svm.core.jdk.UnsupportedFeatureError: Unresolved element found
```

This error results when the -H:+ReportUnsupportedElementsAtRuntime is not included

```
    classlist:   5,125.01 ms
           (cap):   1,124.04 ms
           setup:   1,287.65 ms
        analysis:   2,453.45 ms
    error: Error loading a referenced type: java.lang.NoClassDefFoundError: com/typesafe/config/ConfigFactory
    Detailed message:
    Error: Error loading a referenced type: java.lang.NoClassDefFoundError: com/typesafe/config/ConfigFactory
    Trace:
    	at parsing Main$.main(Main.scala:11)
    Call path from entry point to Main$.main(String[]):
    	at Main$.main(Main.scala:8)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
    Original exception that caused the problem: java.lang.NoClassDefFoundError: com/typesafe/config/ConfigFactory
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
    	at com.oracle.graal.pointsto.flow.SpecialInvokeTypeFlow.onObservedUpdate(InvokeTypeFlow.java:421)
    	at com.oracle.graal.pointsto.flow.TypeFlow.notifyObservers(TypeFlow.java:347)
    	at com.oracle.graal.pointsto.flow.TypeFlow.update(TypeFlow.java:389)
    	at com.oracle.graal.pointsto.BigBang$2.run(BigBang.java:502)
    	at com.oracle.graal.pointsto.util.CompletionExecutor.lambda$execute$0(CompletionExecutor.java:174)
    	at java.util.concurrent.ForkJoinTask$RunnableExecuteAction.exec(ForkJoinTask.java:1402)
    	at java.util.concurrent.ForkJoinTask.doExec(ForkJoinTask.java:289)
    	at java.util.concurrent.ForkJoinPool$WorkQueue.runTask(ForkJoinPool.java:1056)
    	at java.util.concurrent.ForkJoinPool.runWorker(ForkJoinPool.java:1692)
    	at java.util.concurrent.ForkJoinWorkerThread.run(ForkJoinWorkerThread.java:157)
    Caused by: java.lang.ClassNotFoundException: com.typesafe.config.ConfigFactory
    	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
    	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
    	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
    	... 33 more

    Error: Processing image build request failed
```