#Working

When used with the -H:+ReportUnsupportedElementsAtRuntime flag, it seems to work fine. However, when used without this flag, the following error is displayed:

```
classlist:   3,433.74 ms
       (cap):   1,129.46 ms
       setup:   1,320.71 ms
    analysis:   3,015.39 ms
error: unsupported features in 3 methods
Detailed message:
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Unsupported method java.lang.ref.Reference.enqueue() is reachable: The declaring class of this element has been substituted, but this element is not present in the substitution class
To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
Trace:
	at parsing org.postgresql.core.v3.Portal.close(Portal.java:30)
Call path from entry point to org.postgresql.core.v3.Portal.close():
	at org.postgresql.core.v3.Portal.close(Portal.java:28)
	at org.postgresql.jdbc.PgResultSet.close(PgResultSet.java:1879)
	at org.postgresql.jdbc.PgStatement.executeInternal(PgStatement.java:431)
	at org.postgresql.jdbc.PgStatement.execute(PgStatement.java:374)
	at org.postgresql.jdbc.PgPreparedStatement.executeWithFlags(PgPreparedStatement.java:155)
	at org.postgresql.jdbc.PgPreparedStatement.execute(PgPreparedStatement.java:144)
	at Main$.main(Main.scala:26)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Unsupported method java.lang.ref.Reference.enqueue() is reachable: The declaring class of this element has been substituted, but this element is not present in the substitution class
To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
Trace:
	at parsing org.postgresql.core.v3.SimpleQuery.setCleanupRef(SimpleQuery.java:290)
Call path from entry point to org.postgresql.core.v3.SimpleQuery.setCleanupRef(PhantomReference):
	at org.postgresql.core.v3.SimpleQuery.setCleanupRef(SimpleQuery.java:288)
	at org.postgresql.core.v3.QueryExecutorImpl.registerParsedQuery(QueryExecutorImpl.java:1882)
	at org.postgresql.core.v3.QueryExecutorImpl.sendParse(QueryExecutorImpl.java:1397)
	at org.postgresql.core.v3.QueryExecutorImpl.sendOneQuery(QueryExecutorImpl.java:1762)
	at org.postgresql.core.v3.QueryExecutorImpl.sendAutomaticSavepoint(QueryExecutorImpl.java:355)
	at org.postgresql.core.v3.QueryExecutorImpl.execute(QueryExecutorImpl.java:297)
	at org.postgresql.jdbc.PgStatement.executeInternal(PgStatement.java:427)
	at org.postgresql.jdbc.PgStatement.execute(PgStatement.java:374)
	at org.postgresql.jdbc.PgPreparedStatement.executeWithFlags(PgPreparedStatement.java:155)
	at org.postgresql.jdbc.PgPreparedStatement.execute(PgPreparedStatement.java:144)
	at Main$.main(Main.scala:26)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)
Error: com.oracle.graal.pointsto.constraints.UnsupportedFeatureException: Unsupported method java.lang.ref.Reference.enqueue() is reachable: The declaring class of this element has been substituted, but this element is not present in the substitution class
To diagnose the issue, you can add the option -H:+ReportUnsupportedElementsAtRuntime. The unsupported element is then reported at run time when it is accessed the first time.
Trace:
	at parsing org.postgresql.core.v3.SimpleQuery.unprepare(SimpleQuery.java:298)
Call path from entry point to org.postgresql.core.v3.SimpleQuery.unprepare():
	at org.postgresql.core.v3.SimpleQuery.unprepare(SimpleQuery.java:296)
	at org.postgresql.core.v3.SimpleQuery.close(SimpleQuery.java:62)
	at org.postgresql.jdbc.PgStatement.execute(PgStatement.java:372)
	at org.postgresql.jdbc.PgPreparedStatement.executeWithFlags(PgPreparedStatement.java:155)
	at org.postgresql.jdbc.PgPreparedStatement.execute(PgPreparedStatement.java:144)
	at Main$.main(Main.scala:26)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
	at com.oracle.svm.core.code.CEntryPointCallStubs.com_002eoracle_002esvm_002ecore_002eJavaMainWrapper_002erun_0028int_002corg_002egraalvm_002enativeimage_002ec_002etype_002eCCharPointerPointer_0029(generated:0)

Error: Processing image build request failed
```