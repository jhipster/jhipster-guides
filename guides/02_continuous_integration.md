# Continuous Integration

<walkthrough-tutorial-duration duration="10"></walkthrough-tutorial-duration>

Setting up Continuous Integration (CI) for a JHipster application is harder than for a classic typical Spring MVC application because 
of the complexity associated with maintaining a build composed of 2 software stacks:
* the Java back-end code with Maven or Gradle
* the JavaScript front-end with NodeJS, NPM or Yarn
Each stack comes with its own dependency management (Maven artifacts, NPM packages) with potential conflicts to solve.

JHipster should support the following CI systems out of the box:
* Jenkins ([Jenkins 1](https://www.jhipster.tech/setting-up-ci-jenkins1/) and [Jenkins 2](https://www.jhipster.tech/setting-up-ci-jenkins2/))
* [Travis](https://docs.travis-ci.com/user/getting-started/)
* [GitLab CI](https://about.gitlab.com/gitlab-ci/)
* [Azure Pipelines](https://docs.microsoft.com/fr-fr/azure/devops/pipelines/?view=vsts)

A more detailed guide for continuous integration is available on the official [jhipster](https://www.jhipster.tech/setting-up-ci/) website.

In this tutorial we will focus on **Travis CI**.

## Generate the configuration file

To generate these config files, run this command in you projet folder:
```bash
jhipster ci-cd
```

---

What CI/CD pipeline do you want to generate?

* Jenkins pipeline
* Azure Pipelines
* GitLab CI
* Travis CI

In this tutorial we will choose **Travis CI**

---

What tasks/integrations do you want to include?
* Analyze your code with \*Sonar\* (requires SONAR_TOKEN set on CI service)
* Deploy to \*Heroku\* (requires HEROKU_API_KEY set on CI service)

---

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You are now ready to create an application.

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/01_creating_your_application.md;
```