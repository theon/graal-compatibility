#Error

finagle throws an error:

When this line is run:
```
     val server = Http.serve(":8080", service)
```

This error results from the native-image script

```
    RecomputeFieldValue.FieldOffset automatic substitution failed. The automatic substitution registration was attempted because a call to sun.misc.Unsafe.objectFieldOffset(Field) was detected in the static initializer of com.twitter.util.Promise$. Add a RecomputeFieldValue.FieldOffset manual substitution for com.twitter.util.Promise$.
        analysis:   2,350.71 ms
    fatal error: java.lang.TypeNotPresentException: Type org.jboss.netty.handler.codec.http.HttpRequest not present
    	at sun.reflect.generics.factory.CoreReflectionFactory.makeNamedType(CoreReflectionFactory.java:117)
    	at sun.reflect.generics.visitor.Reifier.visitClassTypeSignature(Reifier.java:125)
    	at sun.reflect.generics.tree.ClassTypeSignature.accept(ClassTypeSignature.java:49)
    	at sun.reflect.generics.visitor.Reifier.reifyTypeArguments(Reifier.java:68)
    	at sun.reflect.generics.visitor.Reifier.visitClassTypeSignature(Reifier.java:138)
    	at sun.reflect.generics.tree.ClassTypeSignature.accept(ClassTypeSignature.java:49)
    	at sun.reflect.generics.repository.ClassRepository.getSuperclass(ClassRepository.java:90)
    	at java.lang.Class.getGenericSuperclass(Class.java:777)
    	at com.oracle.svm.hosted.analysis.Inflation.fillGenericInfo(Inflation.java:260)
    	at com.oracle.svm.hosted.analysis.Inflation.checkType(Inflation.java:149)
    	at java.lang.Iterable.forEach(Iterable.java:75)
    	at java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1080)
    	at com.oracle.svm.hosted.analysis.Inflation.checkObjectGraph(Inflation.java:126)
    	at com.oracle.graal.pointsto.BigBang.checkObjectGraph(BigBang.java:584)
    	at com.oracle.graal.pointsto.BigBang.finish(BigBang.java:556)
    	at com.oracle.svm.hosted.NativeImageGenerator.doRun(NativeImageGenerator.java:674)
    	at com.oracle.svm.hosted.NativeImageGenerator.lambda$run$0(NativeImageGenerator.java:397)
    	at java.util.concurrent.ForkJoinTask$AdaptedRunnableAction.exec(ForkJoinTask.java:1386)
    	at java.util.concurrent.ForkJoinTask.doExec(ForkJoinTask.java:289)
    	at java.util.concurrent.ForkJoinPool$WorkQueue.runTask(ForkJoinPool.java:1056)
    	at java.util.concurrent.ForkJoinPool.runWorker(ForkJoinPool.java:1692)
    	at java.util.concurrent.ForkJoinWorkerThread.run(ForkJoinWorkerThread.java:157)
    Caused by: java.lang.ClassNotFoundException: org.jboss.netty.handler.codec.http.HttpRequest
    	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
    	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
    	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
    	at java.lang.Class.forName0(Native Method)
    	at java.lang.Class.forName(Class.java:348)
    	at sun.reflect.generics.factory.CoreReflectionFactory.makeNamedType(CoreReflectionFactory.java:114)
    	... 21 more
    Error: Processing image build request failed

```