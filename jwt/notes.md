#Failing

Fails when executable is run with and without the -H:+ReportUnsupportedElementsAtRuntime flag with the following error:

```
Exception in thread "main" com.oracle.svm.core.jdk.UnsupportedFeatureError: unimplemented
	at java.lang.Throwable.<init>(Throwable.java:265)
	at java.lang.Error.<init>(Error.java:70)
	at com.oracle.svm.core.jdk.UnsupportedFeatureError.<init>(UnsupportedFeatureError.java:31)
	at com.oracle.svm.core.jdk.Target_com_oracle_svm_core_util_VMError.unsupportedFeature(VMErrorSubstitutions.java:109)
	at com.oracle.svm.core.jdk.Target_com_oracle_svm_core_util_VMError.unimplemented(VMErrorSubstitutions.java:103)
	at com.oracle.svm.core.jdk.Target_javax_crypto_JceSecurity.getVerificationResult(SecuritySubstitutions.java:384)
	at javax.crypto.JceSecurity.getInstance(JceSecurity.java:102)
	at javax.crypto.Mac.getInstance(Mac.java:222)
	at pdi.jwt.JwtUtils$.sign(JwtUtils.scala:121)
	at pdi.jwt.JwtUtils$.sign(JwtUtils.scala:150)
	at pdi.jwt.JwtUtils$.sign(JwtUtils.scala:159)
	at pdi.jwt.JwtCore.encode(Jwt.scala:80)
	at pdi.jwt.JwtCore.encode$(Jwt.scala:78)
	at pdi.jwt.Jwt$.encode(Jwt.scala:23)
	at pdi.jwt.JwtCore.encode(Jwt.scala:109)
	at pdi.jwt.JwtCore.encode$(Jwt.scala:108)
	at pdi.jwt.Jwt$.encode(Jwt.scala:23)
	at Main$.main(Main.scala:7)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
```