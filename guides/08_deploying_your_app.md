# Deploying your app

<walkthrough-tutorial-duration duration="20"></walkthrough-tutorial-duration>

## Testing a production package
This allows to test a production build from Maven, without building a real package. 
To use JHipster in “production” mode, use the pre-configured prod profile. With Maven, please run:

```bash
./mvnw -Pprod
```

This profile will compile, test and package your application with all productions settings.  
If you want more information on the available profiles, please go the section titled [Development and Production profiles](https://www.jhipster.tech/profiles/).

Next we will deploy our application using Docker, however if you want to build and execute WAR file, you can check it out on [JHipster website](https://www.jhipster.tech/production/).

## Deploying with docker
JHipster provides a complete Docker support, in order to:
* Facilitate development, as you can start a full infrastructure very easily, even when using a complex microservice architecture
* Deploy directly in production if you use Docker Swarm, as it uses the same Docker Compose configuration  

One great feature of using Docker Compose is that you can easily scale your containers, using the docker-compose scale command. This is very interesting if you use JHipster with a microservice architecture.  

When generating your application, JHipster generates for you:  

* A Dockerfile for building a Docker image and running your application inside a container  
* Several Docker Compose configurations to help you run your application with third-party services, for example a database  

Those files are located in the folder src/main/docker/.

### Prerequisites
You have to install :
* Docker
* Docker Compose  
Luckily, you do not need to install it with Google Cloud Shell.

### Build and running a Docker image of your application
To create a Docker image of your application, and push it into your Docker registry:
```bash
./mvnw package -Pprod verify jib:dockerBuild
```
This process takes some time to complete (about 15 minutes with the boost mode on).


To run this image, use the Docker Compose configuration located in the src/main/docker folder of your application:
```bash
docker-compose -f src/main/docker/app.yml up
```

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! Your application is now deployed with Docker !
You can check out your application with the Google Cloud Shell web preview feature.
