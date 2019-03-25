# 01. Creating your application
<walkthrough-tutorial-duration duration="15">
</walkthrough-tutorial-duration>
## Quick Start

In this tutorial, we will create an application named BugTrackerJHipster that is inspired from the issue tracking system from [GitHub](https://github.com/)

1. First of all, go to the directory you've created in the previous tutorial

```bash
cd ~/BugTrackerJHipster
```

2. To generate your application, type:

```bash
jhipster
```
Click on the Next button at the bottom right of this window to know how to generate an application

## Generating your application (1/6)

_Some questions change depending on the previous choices you have made. For example, you won't need to configure an Hibernate cache if you didn't select a SQL database_

---

1. May **JHipster** anonymously report usage statistics to improve the tool over time?

This is a feature to help us track [statistics](https://start.jhipster.tech/#/statistics) so we can know on which technologies we have to focus on developping. We highly recommend you to choose yes on this first question. Note that this question will only be asked once.

---

2. Which _type_ of application would you like to create ?

Your type of application depends on whether you wish to use a microservices architecture or not. A full explanation on microservices is [available here](https://www.jhipster.tech/microservices-architecture/), if unsure use the default _Monolithic application_. **That is what we are doing in this tutorial**.

For your future projects, you can either use:
* Monolithic application: that is a classical, one-size-fits-all application. It's easier to use and develop, and is our recommended default.
* Microservice application: in a microservices architecture, this is one of the services.
* Microservice gateway: in a microservices architecture, this is an edge server that routes and secures requests.
* JHipster UAA server: in a microservices architecture, this is an OAuth2 authentication server that secures microservices. Refer to the [Jhipster UAA documentation](https://www.jhipster.tech/using-uaa/) for more information.

## Generating your application (2/6)

3. What is the base name of your application?

That is the name of your application. By default, it has the same name as the directory you are in. In our case, it displays BugTrackerJHipster, press **Enter** to validate it.

---

4. What is your default Java package name?

Your Java application will use this as its root package. This value is stored by Yeoman so that the next time you run the generator the last value will become default. Of course, you can override it by providing a new value.
For this tutorial, let's go with **com.mycompany.bugtracker**

---

5. Do you want to use the JHipster Registry to configure, monitor and scale your application?

The [JHipster registry](https://www.jhipster.tech/jhipster-registry/) is an Open Source tool used to manage your application at runtime.
It is required when using a microservices architecture (this is why this question is only asked when generating a monolith, like in our case).
Choose **Yes** at this question.

---

6. Which _type_ of database would you like to use?

You can choose between:
* a SQL database (H2, MySQL, MariaDB, PostgreSQL, MSSQL, Oracle), which you will access with Spring Data JPA
* [MongoDB](https://www.jhipster.tech/using-mongodb/)
* [Cassandra](https://www.jhipster.tech/using-cassandra/)
* [Couchbase](https://www.jhipster.tech/using-couchbase/)
* No database (only available when using a [microservice application](https://www.jhipster.tech/microservices-architecture/) with JWT authentication)

For BugTracker, let's go with an **SQL database**.

## Generating your application (3/6)


7. Which _production_ database would you like to use?
* MySQL
* MariaDB
* PostgreSQL
* Oracle (Please follow our documentation to use the Oracle proprietary driver)
* Microsoft SQL server

Take **MySQL** for this question.

If you want to use Oracle, you will need to [install the Oracle JDBC driver manually](https://www.jhipster.tech/using-oracle/)



---

8. Which _development_ database would you like to use?

* H2, with its data stored on disk. This is a better option than running in-memory, as you won't lose your data upon application restart.
* H2, running in-memory. This is the easiest way to use JHipster, but your data will be lost when you restart your server.
* The same database as the one you chose for production: a bit more complex to set up, but working on the same database as the one you will use in production should be better at the end. This is also the best way to use liquibase-hibernate as described in [the development guide](https://www.jhipster.tech/development/).

Take the **data-stored-on-disk-based H2** stored one.

---

9. Do you want to use the Spring cache abstraction?

The spring cache abstraction allows to use different cache implementations:

* [ehcache](http://ehcache.org/) (local cache)
* [Hazelcast](http://www.hazelcast.com/) (distributed cache)
* [Infinispan](http://infinispan.org/) (another distributed cache).
* [Memcached](https://memcached.org/) (yet another distributed cache)
* No cache, but be aware that when using a SQL database, this will disable the Hibernate 2nd level cache.

Let's take **ehcache** for our BugTracker.

Also, this can have a very positive impact on your application's performance. Hence, it is a recommended option. 

## Generating your application (4/6)

10. Do you want to use Hibernate 2nd level cache?

This option will only be available if you chose a SQL database (as JHipster will use Spring Data JPA to access it) and a cache provider in the previous question. 

[Hibernate](http://hibernate.org/) is the JPA provider used by JHipster, and it can use a cache provider to greatly improve its performance. As a result, we highly recommend you to use this option, and to tune your cache implementation according to your application's needs: **Yes**.

---

11. Would you like to use Maven or Gradle for building the backend?

You can build your generated Java application with either [Maven](https://maven.apache.org/) or [Gradle](http://www.gradle.org/).
Maven is more stable and more mature. Gradle is more flexible, easier to extend and more hype.

For this one, let's go with **Maven**.

---

12. Which other technologies would you like to use?

This is a multiple choice answers, to add one or several other technologies to the application.
Here, you have to press `space` to select, `a` to toggle everything and `i` if you want to invert selection. The available technologies are:

* Search engine using Elasticsearch. [Elasticsearch](https://github.com/elastic/elasticsearch) will be configured using Spring Data Elasticsearch, you can find more information on our [ElasticSearch guide](https://www.jhipster.tech/using-elasticsearch/).
* WebSockets using Spring Websocket. Websockets can be enabled using Spring Websocket. We also provide a complete sample to show you how to use the framework efficiently.
* Asynchronous messages using Apache Kafka. Use [Apache Kafka](https://www.jhipster.tech/using-kafka/) as a publish/subscribe message broker.
* API first development using OpenAPI-generator. This option lets you do [API-first development](https://www.jhipster.tech/doing-api-first-development) for your application by integrating the [Swagger-Codegen](https://github.com/swagger-api/swagger-codegen) into the the build.

In our case, we'd like to keep it as simple as possible so we are not going to choose any of them and just press **Enter**.

## Generating your application (5/6)

13. Which _Framework_ would you like to use for the client?

* [Angular](https://angular.io/)
* [React](https://reactjs.org/)

Because we have to choose, let's take **Angular**

---

14. Would you like to enable _SASS_ stylesheet preprocessor?

[Sass](https://sass-lang.com) is a great solution to simplify designing CSS. To be used efficiently, you will need to run a [Webpack](https://webpack.js.org) dev server, which will be configured automatically.

Don't worry, even if you don't know anything about _SASS_, we'll keep it simple enough so that anyone can understand ! Go with **Yes**.

---

15. Would you like to enable internationalization support?

By default JHipster provides an excellent internationalization support,  both on the client side and on the server side. However, internationalization adds a little overhead, and is a little bit more complex to manage, so you can choose not to install this feature.

Please note that JHipster covers only UI internationalization. For data internationalization, you will need to code it yourself in JPA/Hibernate layer.

We are going to say **Yes** for educational purpose here but don't worry, as we will only touch the english part of the server.

---

16. Please choose the native language of the application

This is the main language of your application: you are free to choose anything but for this tutorial, let's go with **English**

## Generating your application (6/6)

17. Please choose additional languages to install.

Like earlier, this is a multiple-choice question so the commands are the same. But then again, let's say we will support **French** language in BugTracker.

---

18. Besides JUnit and Jest, which testing frameworks would you like to use?

By default, JHipster provide Java Unit/integration testing (using Spring's JUnit support) and JavaScript unit testing (using Jest). As an option, you can also add support for:

* Performance tests using Gatling
* Behaviour tests using Cucumber
* Angular integration tests with Protractor

Later in the tutorial, we will learn how to test our application. For now, press **A** to select all of them and press **Enter**.

---

19. Would you like to install other generators from the JHipster Marketplace?

The [JHipster Marketplace](https://www.jhipster.tech/modules/marketplace/) is where you can install additional modules, written by third-party developers, to add non-official features to your project.

We won't be using any of these in this tutorial, hence we will choose **No**.

---

JHipster should start generating the files: here are some tips in the meanwhile.

You can also use the Yeoman command-line options, like ```--force``` to automatically overwrite existing files. So if you want to regenerate your whole application, including its entities, you can run ```jhipster --force --with-entities```


<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You have generated an application !

If you've not yet added a repository on your github, we highly recommend you to do so. You can follow [GitHub's documentation](https://help.github.com/en/articles/adding-an-existing-project-to-github-using-the-command-line) to add this now existing project to your repository on GitHub.

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/02_continuous_integration.md;
```
