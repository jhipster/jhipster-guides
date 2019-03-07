# 00. Setting up your environment

<walkthrough-tutorial-duration duration="5">
</walkthrough-tutorial-duration>

## Google Cloud Shell
We strongly recommend you to activate the boost mode in order to get better performance.
To activate boost mode, find the 'Enable Boost Mode' option under the 'More' menu (the three dotted icon on the top right of Cloud Shell).

## Pre-requirements

To run JHipster, you will need the following technologies.
  
Note that the following ones are already installed in this Cloud Shell:  
1. Java 8 from [the Oracle website](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
JHipster 5.8.1 is using Java 8 and is not compatible with other versions, JHipster 6 will be updated with Java 11.
2. Node.js from [the Node.js website](https://nodejs.org/) (please use a LTS 64-bit version, non-LTS versions are not supported)

From here, please do follow the steps even if you are using google shell cloud.


3. NPM is installed with Node.js but you need to upgrade it:

```bash
npm install -g npm
```

4. Install JHipster:

```bash
npm install -g generator-jhipster
```

## Creating a repository

To work with JHipster, we **highly** recommend you to use [GitHub](https://github.com/). If you are unfamiliar with how versioning tools work, please head to the [documentations](https://guides.github.com/).

Start by creating a folder that will contain your future application, in our case we will create an application named BugTrackerJHipster so you can name your folder so.

```bash
mkdir ~/BugTrackerJHipster
```

If you're running these tutorials locally, we recommend you to use your usual workspace (and therefore not use the absolute path to create and access your application folder).

If you're using Google Cloud Shell, please do set up your git like so : 

```bash
git config --global user.name "John Doe";
git config --global user.email johndoe@example.com
```
After that, start by setting up your repository to make it ready to receive the generated application.

Please note that the Google Cloud Shell will persist while the session is active and will stop after an hour of inactivity.

This is why we recommend you to use a repository to make sure that your project is not lost, even when you are going for a lunch break !

---

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You are now ready to create an application.

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/01_creating_your_application.md;
```
