Failing:

- mariaDb
- mySql Driver
- finagle
- slick
- bugsnag
- jwt

Kind of working
- postgres driver (when the ReportUnsupportedElementsAtRuntime flag is included, otherwise error is thrown)
- Jodatime (throws an error because it cant find certain timezone resources packaged in its .jar, but it still works)

Everything else seems to be OK.

Notes:
When an executable made with graal is run and the following error is displayed:

```
com.oracle.svm.core.jdk.UnsupportedFeatureError: Unresolved element found
```

Try remaking the image without the ReportUnsupportedElementsAtRuntime flag for a more useful result.

This is usually because the ReportUnsupportedElementsAtRuntime has been used to build the executable,
which I think supresses errors in the build proccess and instead displays them at runtime. However it also looks
like information is lost in this process, so you end up with a useless error message.