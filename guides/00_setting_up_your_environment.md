# 00. Setting up your environment

## Pre-requirements

To run JHipster, you will need the following technologies.
  
Note that the following ones are already installed in this Cloud Shell:  
1. Java 8 from [the Oracle website](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
2. Node.js from [the Node.js website](https://nodejs.org/) (please use a LTS 64-bit version, non-LTS versions are not supported)

From here, please do follow the steps even if you are using google shell cloud.


3. NPM is installed with Node.js but you need to upgrade it:

```bash
npm install -g npm
```

4. If you want to use the JHipster Marketplace, install Yeoman:

```bash
npm install -g yo
```

5. Install JHipster:

```bash
npm install -g generator-jhipster
```

---

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You are now ready to create an application.

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/01_creating_your_application.md;
```