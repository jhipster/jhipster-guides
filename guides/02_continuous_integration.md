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

To generate these config files, run the following command in your projet folder:
```bash
jhipster ci-cd
```

---

What CI/CD pipeline do you want to generate?

* Jenkins pipeline
* Azure Pipelines
* GitLab CI
* Travis CI

In this tutorial we will choose **Travis CI**.

---

What tasks/integrations do you want to include?
* Analyze your code with \*Sonar\* (requires SONAR_TOKEN set on CI service)
* Deploy to \*Heroku\* (requires HEROKU_API_KEY set on CI service)

In this tutorial we won't use Sonar or Heroku, juste press **Enter** to skip it.

The JHipster sub-generator will generate a yaml configuration file for travis in the <walkthrough-editor-open-file filePath="BugTrackerJHipster/.travis.yml">root project.</walkthrough-editor-open-file>



## GitHub
In this section, we will show you how to configure a remote repository with git on GitHub.

1. Create an account or signin on [GitHub](https://github.com/)

2. Create a new public repository named **BugTrackerJHipster**

Now, go on the BugTracker folder:
```bash
cd ~/BugTrackerJHipster
```

and execute the following command:
```bash
git remote add origin https://github.com/YOUR_GITHUB/BugTrackerJHipster
```

Now commit the file generated with the sub-generator for continuous integration:
```bash
git add .
git commit -m "initial commit"
```

You can now push all the changes in the remote repository with the following command:
```bash
git push --set-upstream origin master
```

## Travis CI
Travis CI is a service to build and test software hosted on GitHub. When activated on a particular 
repository, any push or pull request will trigger the build and tests using the <walkthrough-editor-open-file filePath="BugTrackerJHipster/.travis.yml">configuration file.</walkthrough-editor-open-file>
This is what we are going to do for the BugTracker project.

1. Sign in to [Travis CI website](https://travis-ci.org/) with your GitHub account

2. Go to your [repository list](https://travis-ci.org/account/repositories)

3. Activate Travis CI for the BugTrackerJHipster repository

Travis CI is now installed on your BugTracker repository. You can commit and push a change to see 
 [Travis](https://travis-ci.org/) build and run the tests.

---

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You just set up the continuous integration for your project.

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/03_jhipster_app.md;
```
