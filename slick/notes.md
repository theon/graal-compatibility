#Error

mariaDb throws an error when opening a database connection:

When this line is run:
```
    val connection = dbDriver.connect(url, info)
```

This error results from the native-image script

```
    classlist:   4,707.46 ms
           (cap):   1,135.33 ms
           setup:   1,422.98 ms
      (typeflow):   2,914.58 ms
       (objects):   2,265.24 ms
      (features):      42.73 ms
        analysis:   5,317.47 ms
        universe:     195.66 ms
    error: unsupported features in 5 methods
    Detailed message:
    Error: Unsupported method sun.management.MemoryImpl.getMemoryManagers0() is reachable: Native method. If you intend to use the Java Native Interface (JNI), specify -H:+JNI and see also -H:JNIConfigurationFiles=<path> (use -H:+PrintFlags for details)
    To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
    Call path from entry point to sun.management.MemoryImpl.getMemoryManagers0():
    	at sun.management.MemoryImpl.getMemoryManagers0(MemoryImpl.java)
    	at sun.management.MemoryImpl.getMemoryManagers(MemoryImpl.java:98)
    	at sun.management.ManagementFactoryHelper.getMemoryManagerMXBeans(ManagementFactoryHelper.java:121)
    	at java.lang.management.PlatformComponent$5.getMXBeans(PlatformComponent.java:130)
    	at java.lang.management.PlatformComponent.getMXBeans(PlatformComponent.java:377)
    	at java.lang.management.ManagementFactory.getPlatformMBeanServer(ManagementFactory.java:472)
    	at com.mysql.cj.jdbc.jmx.LoadBalanceConnectionGroupManager.registerJmx(LoadBalanceConnectionGroupManager.java:54)
    	at com.mysql.cj.jdbc.ConnectionGroupManager.registerJmx(ConnectionGroupManager.java:63)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.<init>(LoadBalancedConnectionProxy.java:148)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.createProxyInstance(LoadBalancedConnectionProxy.java:117)
    	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:210)
    	at Main$.main(Main.scala:25)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
    Error: Unsupported method sun.management.MemoryImpl.getMemoryPools0() is reachable: Native method. If you intend to use the Java Native Interface (JNI), specify -H:+JNI and see also -H:JNIConfigurationFiles=<path> (use -H:+PrintFlags for details)
    To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
    Call path from entry point to sun.management.MemoryImpl.getMemoryPools0():
    	at sun.management.MemoryImpl.getMemoryPools0(MemoryImpl.java)
    	at sun.management.MemoryImpl.getMemoryPools(MemoryImpl.java:92)
    	at sun.management.ManagementFactoryHelper.getMemoryPoolMXBeans(ManagementFactoryHelper.java:112)
    	at java.lang.management.PlatformComponent$6.getMXBeans(PlatformComponent.java:144)
    	at java.lang.management.PlatformComponent.getMXBeans(PlatformComponent.java:377)
    	at java.lang.management.ManagementFactory.getPlatformMBeanServer(ManagementFactory.java:472)
    	at com.mysql.cj.jdbc.jmx.LoadBalanceConnectionGroupManager.registerJmx(LoadBalanceConnectionGroupManager.java:54)
    	at com.mysql.cj.jdbc.ConnectionGroupManager.registerJmx(ConnectionGroupManager.java:63)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.<init>(LoadBalancedConnectionProxy.java:148)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.createProxyInstance(LoadBalancedConnectionProxy.java:117)
    	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:210)
    	at Main$.main(Main.scala:25)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
    Error: Unsupported method sun.management.VMManagementImpl.getStartupTime() is reachable: Native method. If you intend to use the Java Native Interface (JNI), specify -H:+JNI and see also -H:JNIConfigurationFiles=<path> (use -H:+PrintFlags for details)
    To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
    Call path from entry point to sun.management.VMManagementImpl.getStartupTime():
    	at sun.management.VMManagementImpl.getStartupTime(VMManagementImpl.java)
    	at sun.management.RuntimeImpl.<init>(RuntimeImpl.java:55)
    	at sun.management.ManagementFactoryHelper.getRuntimeMXBean(ManagementFactoryHelper.java:92)
    	at java.lang.management.PlatformComponent$8.getMXBeans(PlatformComponent.java:170)
    	at java.lang.management.PlatformComponent.getMXBeans(PlatformComponent.java:377)
    	at java.lang.management.ManagementFactory.getPlatformMBeanServer(ManagementFactory.java:472)
    	at com.mysql.cj.jdbc.jmx.LoadBalanceConnectionGroupManager.registerJmx(LoadBalanceConnectionGroupManager.java:54)
    	at com.mysql.cj.jdbc.ConnectionGroupManager.registerJmx(ConnectionGroupManager.java:63)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.<init>(LoadBalancedConnectionProxy.java:148)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.createProxyInstance(LoadBalancedConnectionProxy.java:117)
    	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:210)
    	at Main$.main(Main.scala:25)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
    Error: Unsupported method sun.management.VMManagementImpl.isThreadAllocatedMemoryEnabled() is reachable: Native method. If you intend to use the Java Native Interface (JNI), specify -H:+JNI and see also -H:JNIConfigurationFiles=<path> (use -H:+PrintFlags for details)
    To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
    Call path from entry point to sun.management.VMManagementImpl.isThreadAllocatedMemoryEnabled():
    	at sun.management.VMManagementImpl.isThreadAllocatedMemoryEnabled(VMManagementImpl.java)
    	at sun.management.ThreadImpl.<init>(ThreadImpl.java:56)
    	at sun.management.ManagementFactoryHelper.getThreadMXBean(ManagementFactoryHelper.java:85)
    	at java.lang.management.PlatformComponent$9.getMXBeans(PlatformComponent.java:183)
    	at java.lang.management.PlatformComponent.getMXBeans(PlatformComponent.java:377)
    	at java.lang.management.ManagementFactory.getPlatformMBeanServer(ManagementFactory.java:472)
    	at com.mysql.cj.jdbc.jmx.LoadBalanceConnectionGroupManager.registerJmx(LoadBalanceConnectionGroupManager.java:54)
    	at com.mysql.cj.jdbc.ConnectionGroupManager.registerJmx(ConnectionGroupManager.java:63)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.<init>(LoadBalancedConnectionProxy.java:148)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.createProxyInstance(LoadBalancedConnectionProxy.java:117)
    	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:210)
    	at Main$.main(Main.scala:25)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
    Error: Unsupported method sun.management.VMManagementImpl.isThreadCpuTimeEnabled() is reachable: Native method. If you intend to use the Java Native Interface (JNI), specify -H:+JNI and see also -H:JNIConfigurationFiles=<path> (use -H:+PrintFlags for details)
    To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
    Call path from entry point to sun.management.VMManagementImpl.isThreadCpuTimeEnabled():
    	at sun.management.VMManagementImpl.isThreadCpuTimeEnabled(VMManagementImpl.java)
    	at sun.management.ThreadImpl.<init>(ThreadImpl.java:55)
    	at sun.management.ManagementFactoryHelper.getThreadMXBean(ManagementFactoryHelper.java:85)
    	at java.lang.management.PlatformComponent$9.getMXBeans(PlatformComponent.java:183)
    	at java.lang.management.PlatformComponent.getMXBeans(PlatformComponent.java:377)
    	at java.lang.management.ManagementFactory.getPlatformMBeanServer(ManagementFactory.java:472)
    	at com.mysql.cj.jdbc.jmx.LoadBalanceConnectionGroupManager.registerJmx(LoadBalanceConnectionGroupManager.java:54)
    	at com.mysql.cj.jdbc.ConnectionGroupManager.registerJmx(ConnectionGroupManager.java:63)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.<init>(LoadBalancedConnectionProxy.java:148)
    	at com.mysql.cj.jdbc.ha.LoadBalancedConnectionProxy.createProxyInstance(LoadBalancedConnectionProxy.java:117)
    	at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:210)
    	at Main$.main(Main.scala:25)
    	at Main.main(Main.scala)
    	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
    	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)

    Error: Processing image build request failed
```