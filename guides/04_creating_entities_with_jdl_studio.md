# 04. Creating entities with JDL Studio

<walkthrough-tutorial-duration duration="10">
</walkthrough-tutorial-duration>

## Introduction

Now that your application is up and running, you will soon need to create _entities_, and so you will need:

* A database table
* A Liquibase change set
* A JPA Entity
* A Spring Data JPA Repository
* A Spring MVC REST Controller, which has the basic CRUD operations
* An Angular router, a component and a service
* An HTML view
* Integration tests to validate everything works as expected
* Performance tests, to see if everything works smoothly

If you have several entities, you will likely want to have relationships between them. For this, you will need:

* A database foreign key
* Specific JavaScript and HTML code to manage this relationship

Thankfully, the "entity" sub-generator will help you create all the required files, and provide a CRUD front-end for each entity (see [Angular project structure](https://www.jhipster.tech/using-angular/)).

## JDL Studio

You can use a graphical tool to create your entities. In this case, we advise you to use [JDL Studio](https://start.jhipster.tech/jdl-studio/), our online tool to create entities and relationships using our domain-specific language [JDL](https://www.jhipster.tech/jdl/).

After clicking on the first link, the JDL Studio opens on a window. You can now start writing your first entity.

The entity declaration is done as follows:

```
entity <entity name> {
    <field name> <type> [<validation> *]
}
```

* `<entity name>` is the name of the entity
* `<field name>` the name of one field of the entity
* `<type>` the JHipster supported type of the field,
* and as an option `<validation>` the validations for the field

The possible types and validations are those described [here](https://www.jhipster.tech/jdl/?hl=fr#annexes). If the validation requires a value, simply add `(<value>)` right after the name of the validation.

Here's an example of a JDL code:

```
entity A
entity B
entity C
entity D {
  name String required
  address String required maxlength(100)
  age Integer required min(18)
}
```

Regexes are a bit special as they are used like this (from v1.3.6):

```
entity A {
  myString String required minlength(1) maxlength(42) pattern(/[A-Z]+/)
}
```

Because the JDL was made to be simple to use and read, if your entity is empty (no field), you can just declare an entity with `entity A` instead of `entity A {}`.

Note that JHipster adds a default `id` field so that you needn't worry about it.

In the JDL Studio, declare the following entities:

**Project**

* has a name of type `String`

**Label**

* has a label of type `String` that is at least 3 characters long

**Ticket**

* has a title of type `String` that is required
* has a description of type `String`
* has a dueDate of type `LocalDate`
* has a done of type `Boolean`

If you've declared them properly, you should see the graphical tool updating itself in real time while you are done creating your entities.
To know more about entity fields, click on the Next button down there.

## Entity fields and field types
For each entity, you can add as many fields as you want. You will need to add their name and type and JHipster will generate for you all the required code and configuration, from the Angular HTML view to the Liquibase changelog.

Those fields cannot contain reserved keywords in the technologies you are using. For example, if you use a MySQL database :

* You cannot use Java reserved keywords (as your code will not compile)
* You cannot use MySQL reserved keywords (as your database schema update will fail)

JHipster supports many field types. This support depends on your database backend, so we use Java types to describe them; a Java `String` will be stored differently in Oracle or Cassandra, and it is one of JHipster's strengths to generate database access code for you.

* `String`: A Java String. Its default size depends on the underlying backend (if you use JPA, it's 255 by default), but you can change it using the validation rules (putting a `max` size of 1024, for example).
* `Integer`: A Java Integer.
* `Long`: A Java Long.
* `Float`: A Java Float.
* `Double`: A Java Double
* `BigDecimal`: A [java.math.BigDecimal](https://docs.oracle.com/javase/8/docs/api/java/math/BigDecimal.html) object, used when you want exact mathematic calculations (often used for financial operations).
* `LocalDate`: A [java.time.LocalDate](https://docs.oracle.com/javase/8/docs/api/java/time/LocalDate.html) object, used to correctly manage dates in Java.
* `Instant`: A [java.time.Instant](https://docs.oracle.com/javase/8/docs/api/java/time/Instant.html) object, used to represent a timestamp, an instantaneous point on the time-line.
* `ZonedDateTime`: A [java.time.ZonedDateTime](https://docs.oracle.com/javase/8/docs/api/java/time/ZonedDateTime.html) object, used to represent a local date-time in a given timezone (typically a calendar appointment). Note that time zones are neither supported by the REST nor by the persistence layers so you should most probably use `Instant` instead.
* `Boolean`: A Java Boolean.
* `Enumeration`: A Java Enumeration object. When this type is selected, the sub-generator will ask you what values you want in your enumeration and it will create a specific `enum` class to store them.
* `Blob`: A Blob object, used to store some binary data. When this type is selected, the sub-generator will ask you if you want to store generic binary data, an image object, or a CLOB(long text). Images will be handled specifically on the Angular side, so they can be displayed to the end user.


## Validation

Validation can be set up for each field. Depending on the field type, different validation options will be available.

Validation will be automatically generated on:

* the HTML views, using the Angular or React validation mechanism
* the Java domain objects, using [Bean Validation](http://beanvalidation.org/)

Bean validation will then be used to automatically validate domain objects when they are used in:

* Spring MVC/REST controllers (using the `@Valid` annotation)
* Hibernate/JPA (entities are automatically validated before being saved)

Validation information will also be used to generate more precise database column metadata:

* Required fields will be marked non-nullable
* Unique fields will create a unique constraint
* Fields which have a maximum length will have the same column length

Validation has a few limitations:

* We don't support all validation options from Angular, React and Bean Validation, as we only support those which are common to both client and server APIs
* Regular Expression patterns don't work the same in JavaScript and in Java, so if you configure one, you might need to tweak one of the generated patterns
* JHipster generates unit tests that work for generic entities, without knowing your validation rules: it is possible that the generated tests do not pass the validation rules. In that case, you will need to update the sample values used in your unit tests, so that they pass the validation rules

## Relationships

Now that you have created your initial entities, you will need to declare your relationships. Entity relationships are only available for SQL databases. It is a fairly complex subject, which has its own documentation page: [Managing relationships](https://www.jhipster.tech/managing-relationships/).
The relationships declaration is done as follows:

```
relationship (OneToMany | ManyToOne | OneToOne | ManyToMany) {
  <from entity>[{<relationship name>[(<display field>)]}] to <to entity>[{<relationship name>[(<display field>)]}]
}
```

* `( OneToMany | ManyToOne | OneToOne | ManyToMany )` is the type of your relationship
* `<from entity>` is the name of the entity owner of the relationship: the source
* `<to entity>` is the name of the entity where the relationship goes: the destination
* `<relationship name>` is the name of the field having the other end as type
* `<display field>` is the name of the field that should show up in select boxes (default: `id`)
* `required` whether the injected field is required
* `with jpaDerivedIdentifier` whether `@MapsId` is used for the association (applicapble only for one-to-one)

Append these to your .jh file:

```
relationship ManyToMany {
    Ticket{label(label)} to Label{ticket}
}

relationship ManyToOne {
    Ticket{project(name)} to Project,
    Ticket{assignedTo(login)} to User{ticket}
}
```

We just declared that:

* A ticket can have many labels attached to it and labels can be attached to many tickets
* A ticket is attached to a single project but a project can be attached to many tickets
* A ticket is assigned to a single user, referred to as his login, but a user can be attached to many tickets

Finally, let's add a pagination for our tickets, add this to your file:

```
paginate Ticket with pagination
```

Please note that pagination is not available if you created your application with [Cassandra](https://www.jhipster.tech/using-cassandra/). Of course, this will be added in a future release.

Pagination uses [the Link Header](https://tools.ietf.org/html/rfc5988), as in the [GitHub API](https://developer.github.com/v3/#pagination), JHipster provides a custom implementation of this specification on both the server (Spring MVC REST) and the client (Angular in our case) sides.

If you look in the `res` folder, you will see a file named <walkthrough-editor-open-file filePath="jhipster-guides/res/jhipster-jdl.jh" text="jhipster-jdl.jh"></walkthrough-editor-open-file> that is the .jh file that should be exported when you click on the top right button "Download text file of this JDL". If you open it, you will see that it is what you've written before.

## Importing the .jh file

After creating the .jh file, you can now generate entities from the JDL file using the `import-jdl` sub-generator, by running `jhipster import-jdl your-jdl-file.jh`

Go to your project directory and type:

```bash
jhipster import-jdl ~/jhipster-guides/res/jhipster-jdl.jh
```

Run the generated test suite, with 

```bash
mvn test
```

Launch the application (for example with `mvn`), log in and click on "Entities" in the menu. You should see the entities you have created with the JDL Studio.

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations! You now know how to create entities !

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/05_updating_your_back-end.md;
```
