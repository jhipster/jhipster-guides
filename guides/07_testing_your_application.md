# 07. Testing your application

<walkthrough-tutorial-duration duration="15">
</walkthrough-tutorial-duration>

## Introduction

JHipster comes with an extensive set of tests, and each generated application has:

*   Integration tests using the Spring Test Context framework.
*   UI tests with [Jest](https://facebook.github.io/jest/).

Optionally, JHipster can also generate:

*   Performance tests with [Gatling.](http://gatling.io/)
*   Behaviour-driven tests with [Cucumber](https://cucumber.io/)
*   Angular/React integration tests with [Protractor](https://angular.github.io/protractor/#/).

We have two goals in generating those tests:

*   Help every JHipster user follow best practices, as we believe tests are a very important part of an application
*   Validate that what is being generated is correct. So even if you don't plan to use those tests at all, doing just a `./mvnw clean test` and `npm test` after generating your application is a good way to know if everything is fine. You are then free to ignore them if you think that testing is a waste of time!

All those tests will be generated in the standard Maven folder `src/test`.

## Integration tests

Integration tests are done with the Spring Test Context framework, and are located in the folder `src/test/java`. JHipster will launch a specific Spring test context, which will be re-used along all tests, as:

*   Your Spring beans should be stateless and thread-safe, and thus can be re-used across your different tests suites.
*   Launching just one Spring context for all the tests if a lot faster than launching a new Spring context for each test.

This Spring test context will use a specific test database for the execution of the tests:

*   If you use a SQL database, JHipster will launch an in-memory H2 instance in order to use a temporary database for its integration tests. Liquibase will be run automatically, and will generate the database schema.
*   If you use Cassandra, JHipster will launch an in-memory Cassandra instance using [CassandraUnit](https://github.com/jsevellec/cassandra-unit).
*   If you use MongoDB, JHipster will launch an in-memory MongoDB instance using [de.flapdoodle.embed.mongo](https://github.com/flapdoodle-oss/de.flapdoodle.embed.mongo).
*   If you use Elasticsearch, JHipster will launch an in-memory Elasticsearch instance using Spring Data Elasticsearch.
*   If you use Couchbase, JHipster will launch a containerized version of Couchbase with Docker using [Couchbase TestContainers](https://github.com/differentway/testcontainers-java-module-couchbase).

Those tests can be run directly in your IDE, by right-clicking on each test class, or by running `./mvnw clean test` (or `./gradlew test` if you run Gradle).

In our case and especially if you are using Google Cloud Shell, run the command in your application folder:

```bash
./mvnw clean test
```

**Limitations:** if the generated entities have some validations, JHipster will not be able to generate the correct values depending on the validation rules because the rules can be complex (i.e. regex pattern). In this case, the tests will fail and you will have to change the values manually to make the tests pass.

Note that the Behaviour-driven development (BDD) is available using [Cucumber](https://cucumber.io/), with its [JVM implementation](https://github.com/cucumber/cucumber-jvm).
[Gherkin](https://docs.cucumber.io/gherkin/reference/) features will have to be written in your `src/test/features` directory.

That means Cucumber, being a JUnit extension, will be ran along your `./mvnw clean test` command.

## Performance tests

Performance tests are done with [Gatling](http://gatling.io/), and are located in the folder `src/test/gatling`. They are generated for each entity, and allows to test each of them with a lot of concurrent user requests.

To run Gatling tests, you must first install Gatling: please go to the [Gatling download page](https://gatling.io/download/) and follow the instructions there. Please note we do not allow to run Gatling from Maven or Gradle, as it causes some classpath issues with other plugins (mainly because of the use of Scala).

**NOTE** We currently support Gatling 2.x only. You can download the latest 2.x version directly from [maven central](https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.3.1/gatling-charts-highcharts-bundle-2.3.1-bundle.zip).

**Warning!** At the moment, those tests do not take into account the validation rules you may have enforced on your entities. Also tests for creating entities that have a required relationship with another entity will fail out of the box. You will anyway need to change those tests, according to your business rules, so here are few tips to improve your tests:

*   On your running application, go to the `Administration > Logs` screen, and put `org.springframework` in `debug` mode. You will see the validation errors, for example.
*   Use the application normally and open the Chrome `console log`: you will be able to see the REST requests with all their parameters, including the HTTP headers.

For running Gatling tests on a microservice application, you have to:

*   Run a registry
*   Run a gateway
*   Run the microservice application
*   Then, you can run Gatling tests

In this tutorial, we've given you an installation script for Gatling.
Run the following command to install it:
```bash
~/jhipster-guides/utils/install-gatling.sh
```

To run the Gatling test, head to:

```bash
cd ~/BugTrackerJHipster/src/test/gatling
```

and run:

```bash
~/jhipster-guides/gatling/bin/gatling.sh
```

Let's stress test our Project API, so choose **1**. You don't especially need to give a simulation id nor a description so you can just skip these parts.

When the test ends, gatling generates an html file that allows you to check the results: feel free to visit the html page!

## UI tests

UI tests come in two flavors with JHipster: unit tests with Jest, and integration tests with Protractor. Only Jest is provided by default, but if you want to have a good test coverage of your application, we recommend that you use both tools together.

### Jest

UI unit tests are located in the folder `src/test/javascript/spec`. They use [Jest](https://facebook.github.io/jest/).

Those tests will mock up the access to the application's REST endpoints, so you can test your UI layer without having to launch the Java back-end.

*   Those tests can be run using `npm test`.
*   Tip: if you want to focus on a single test then change the module description from `describe('...', function() {` to `fdescribe('...', function() {` and Jest will run this test only.

```bash
cd ~/BugTrackerJHipster;npm test
```

### Protractor

UI integration tests are done with [Protractor](https://angular.github.io/protractor/#/), and are located in the folder `src/test/javascript/e2e`.

Those tests will launch a Web browser and use the application like a real user would do, so you need to have a real application running, with its database set-up.

Those tests can be run using `npm run e2e`.

Please note that Protractor test needs a browser to run the protractor tests. If you are using Google Cloud Shell, you will not be able to run Protractor test. If you have set up a repository for your project, you can run them locally after cloning it on your computer.


<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You now know how to test your application !

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/08_deploying_your_app.md;
```
