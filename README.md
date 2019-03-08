# JHipster Guides

Learn how to generate and create your own application with JHipster with these free tutorials !
All you need is a Google account and access to https://console.cloud.google.com (free)

Click the button to run the tutorial:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/jhipster/jhipster-guides&tutorial=guides/00_setting_up_your_environment.md)

**Please note that clicking this button will open the Google Cloud Shell in a new tab, clone the repository tutorials and start the tutorial n°0**

We highly recommend you to follow the tutorial in the right order. By following these tutorials, you will create an application named BugTrackerJHipster that is inspired from the famous Ticket Issue system from GitHub.

Google Cloud Shell allows you to display markdown files to act as a tutorial and lends you a shell console hosted on the cloud.

It is possible to follow the tutorials on your local machine, but be aware that the `teachme` and the `cloudshell launch-tutorial -d` commands are meant to be used only for Google Cloud Shell.

It should be noted that the tutorials are made to be used in the first place with Google Cloud Shell, that is why we are using absolute path (~), if you are doing this tutorial on your local machine, you can freely choose the directory in which you will generate the application.

To run a particular tutorial, use this command in the Google Cloud Shell, replacing  `YOUR_TUTORIAL_NAME` by the name of the tutorial that you want to do:

```bash
teachme ~/jhipster-guides/guides/YOUR_TUTORIAL_NAME.md
```

If your Google Cloud Shell session expires, you will have to follow the steps in tutorial n°0 again. We've provided a minimal script that installs for you in the utils folder. You just need to run this next command in the Google Cloud Shell:

```bash
~/jhipster-guides/utils/setup.sh
```