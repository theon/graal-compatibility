#Failed

Throws a null pointer exception when building with native-image:

```
Exception in thread "main" java.lang.NullPointerException
	at org.yaml.snakeyaml.util.PlatformFeatureDetector.isRunningOnAndroid(PlatformFeatureDetector.java:25)
	at org.yaml.snakeyaml.introspector.PropertyUtils.<init>(PropertyUtils.java:60)
	at org.yaml.snakeyaml.introspector.PropertyUtils.<init>(PropertyUtils.java:50)
	at org.yaml.snakeyaml.constructor.BaseConstructor.getPropertyUtils(BaseConstructor.java:531)
	at org.yaml.snakeyaml.constructor.BaseConstructor.addTypeDescription(BaseConstructor.java:552)
	at org.yaml.snakeyaml.constructor.Constructor.<init>(Constructor.java:84)
	at org.yaml.snakeyaml.constructor.Constructor.<init>(Constructor.java:70)
	at org.yaml.snakeyaml.constructor.Constructor.<init>(Constructor.java:56)
	at org.yaml.snakeyaml.constructor.Constructor.<init>(Constructor.java:46)
	at org.yaml.snakeyaml.Yaml.<init>(Yaml.java:64)
	at Main$.main(Main.scala:9)
	at Main.main(Main.scala)
	at com.oracle.svm.core.JavaMainWrapper.run(JavaMainWrapper.java:177)
```