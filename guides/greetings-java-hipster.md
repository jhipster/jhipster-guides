

# Create and run your first JHipster app with the CLI.

<author name="JHipster team" repositoryUrl="[https://github.com](https://github.com/jhipster/jhipster-guides)" tutorialName="01-greetings-java-hipster"></author>

<tutorial-duration duration="10"></tutorial-duration>


## Installing JHipster and generating your application

In the Google Cloud Shell terminal, install JHipster with:

```
npm install -g generator-jhipster
```

Create a folder and go into it.

```
mkdir myapp && cd myapp
```

Then, run JHipster:

```
jhipster
```

Answer the prompts with these options:

- Type of application: `Monolithic`
- Name of your application: `myApplicationName`
- Java package name: `tech.ippon.myteam`
- JHipster Registry: `No`
- Type of authentification (recommended: `JWT`)
- Type of database: `SQL`
- Production database: `MySQL` or `PostgreSQL` according to your preference
- Development database: `H2 with disk-based persistence`
- Spring cache abstraction : `ehcache`
- Hibernate 2nd level cache: `yes`
- Backend build tool: `Maven`
- Additional technologies: nothing
- Framework for client: `Angular` or `React` according to your preference
- SASS support: `Yes`
- Internationalization: `No`
- Testing framework: nothing
- JHipster Marketplace: nothing

For details about available options, refer to:  [jhipster.tech/creating-an-app](https://www.jhipster.tech/creating-an-app/)

## Starting the generated application

To start your application in development mode, run:

```
./mvnw
```

Once the build is completed, your application will be started on port 8080 and you can access it using the Web Preview.

<walkthrough-spotlight-pointer spotlightId="devshell-web-preview-button" text="Open Web preview">
</walkthrough-spotlight-pointer>

You will then be able to log in to your application as with the login **admin** (password: **admin**).
## Congratulations

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You have managed to generate and run your first JHipster application !