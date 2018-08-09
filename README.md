This repository exists to test Prisma's dependencies against Graal. To do this, each folder contains an sbt project with a dependency inside and a small test. The subprojects are then packaged, built with the native-image command then ran in order to test for errors or incompatibilities. Note that dependencies have to be added in manually, only the testing process is automatic.

Intructions:
```
$ ./check-compatibility

```
or
```
$ ./check-compatibility PROJECT_NAME
```
to check only a particular project

Check the newly created results.txt for the results.

When adding new projects:
- Add the directory (or duplicate an existing subproject and rename it)
- Update Dependencies.scala and build.sbt
- Add the directory name to the list at the top of check-compatibility script
- Run the script
