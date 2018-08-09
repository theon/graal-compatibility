This repository exists to test Prisma's dependencies against Graal. To do this, each folder contains an sbt project with a dependency inside and a small test. The subprojects are then packaged, built with the native-image command then ran in order to test for errors or incompatibilities. Note that dependencies have to be added in manually, only the testing process is automatic.

Intructions:
Install Graal's native-image utility and add it to your path, then run:
```
$ ./check-compatibility

```

Check the newly created results.txt for the results. This file is rewritten when the command is run.

When adding new projects:
- Add the directory (or duplicate an existing subproject and rename it)
- Update Dependencies.scala and build.sbt
- Add the directory name to the list at the top of check-compatibility script and the array
- Run the script
