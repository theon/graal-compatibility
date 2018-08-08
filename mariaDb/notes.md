#Error

mariaDb throws an error when opening a database connection:

When this line is run:
```
    val connection = dbDriver.connect(url, info)
```

This error results from the native-image script

```
    Build on Server(pid: 75265, port: 55205)
    SendBuildRequest [
    -task=com.oracle.svm.hosted.NativeImageGeneratorRunner
    -imagecp
    /Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/svm/builder/svm.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/svm/builder/objectfile.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/svm/builder/pointsto.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/jvmci/graal.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/jvmci/graal-management.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/jvmci/jvmci-api.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/jvmci/jvmci-hotspot.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/boot/graaljs-scriptengine.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/boot/graal-sdk.jar:/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/svm/library-support.jar:/Users/julian/.ivy2/cache/org.scala-lang/scala-library/jars/scala-library-2.12.3.jar:/Users/julian/.ivy2/cache/org.mariadb.jdbc/mariadb-java-client/jars/mariadb-java-client-2.1.2.jar:/Users/julian/Projects/graal-compatibility/mariaDb/target/scala-2.12/mariadb_2.12-0.1.0-SNAPSHOT.jar
    -H:Path=/Users/julian/Projects/graal-compatibility
    -H:Class=Main
    -H:+ReportUnsupportedElementsAtRuntime
    -H:CLibraryPath=/Users/julian/Projects/graal-compatibility/graalvm-ce-1.0.0-rc5/Contents/Home/jre/lib/svm/clibraries/darwin-amd64
    -H:Name=main
    ]
       classlist:   3,505.53 ms
           (cap):     628.94 ms
           setup:     823.63 ms
        analysis:   4,786.77 ms
    error: unsupported features in 2 methods
    Detailed message:
    Error: Detected a started Thread in the image heap. This is not supported. The object was reached from a static initializer. All static class initialization is done during native image construction, thus a static initializer cannot contain code that captures state dependent on the build machine. Write your own initialization methods and call them explicitly from your main entry point.
    Trace: 	object sun.awt.AWTAutoShutdown
    	method sun.awt.AWTAutoShutdown.getInstance()
    Call path from entry point to sun.awt.AWTAutoShutdown.getInstance():
    	at sun.awt.AWTAutoShutdown.getInstance(AWTAutoShutdown.java:133)
    	at java.awt.EventQueue.detachDispatchThread(EventQueue.java:1137)
    	at java.awt.EventDispatchThread.run(EventDispatchThread.java:88)
    	at com.oracle.svm.core.posix.thread.PosixJavaThreads.pthreadStartRoutine(PosixJavaThreads.java:238)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eposix_002ethread_002ePosixJavaThreads_002epthreadStartRoutine_0028com_002eoracle_002esvm_002ecore_002eposix_002ethread_002ePosixJavaThreads_0024ThreadStartData_0029(generated:0)
    Error: Detected a started Thread in the image heap. This is not supported. The object was reached from a static initializer. All static class initialization is done during native image construction, thus a static initializer cannot contain code that captures state dependent on the build machine. Write your own initialization methods and call them explicitly from your main entry point.
    Trace: 	object sun.java2d.opengl.OGLRenderQueue
    	field sun.java2d.opengl.OGLRenderQueue.theInstance

    Error: Processing image build request failed
```