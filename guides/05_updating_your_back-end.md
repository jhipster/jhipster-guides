# 05. Updating your back-end

<walkthrough-tutorial-duration duration="10"></walkthrough-tutorial-duration>

## Ordered tickets

Right now, our tickets are not ordered, unless you click on the column header to sort them manually. We want to change that as we want to have the most urgent tickets on top of the list.

First, head to the <walkthrough-editor-open-file filePath="BugTrackerJHipster/src/main/java/com/mycompany/bugtracker/repository/TicketRepository.java" text="TicketRepository.java"></walkthrough-editor-open-file> file in the back end part of your application and add the following method:

```Java
Page<Ticket> findAllByOrderByDueDateAsc(Pageable pageable);
```

[Spring Data JPA](https://spring.io/projects/spring-data-jpa) will deduce its associated query by parsing the method name, so that you do not have to implement anything else.

Now, head to the file <walkthrough-editor-open-file filePath="BugTrackerJHipster/src/main/java/com/mycompany/bugtracker/web/rest/TicketResource.java" text="TicketResource.java"></walkthrough-editor-open-file> and change the function `getAllTickets` to use our new function instead.

```Java
@GetMapping("/tickets")
public ResponseEntity<List<Ticket>> getAllTickets(Pageable pageable, @RequestParam(required = false, defaultValue = "false") boolean eagerload) {
    log.debug("REST request to get a page of Tickets");
    Page<Ticket> page;
    if (eagerload) {
        page = ticketRepository.findAllWithEagerRelationships(pageable);
    } else {
        //page = ticketRepository.findAll(pageable);
        page = ticketRepository.findAllByOrderByDueDateAsc(pageable);
    }
    HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, String.format("/api/tickets?eagerload=%b", eagerload));
    return ResponseEntity.ok().headers(headers).body(page.getContent());
}
```

If you start your server again, you should see that the tickets are automatically ordered by the due date.

## Assigned tickets

Let's now add up a new API to our server: you want to show your end users only their assigned tickets. For that, let's start by creating a new mapping, add this to the file <walkthrough-editor-open-file filePath="BugTrackerJHipster/src/main/java/com/mycompany/bugtracker/web/rest/TicketResource.java" text="TicketResource.java"></walkthrough-editor-open-file>:

```Java
@GetMapping("/tickets/self")
public ResponseEntity<List<Ticket>> getAllSelfTickets(@ApiParam Pageable pageable, @RequestParam(required = false, defaultValue = "false") boolean eagerload){
    log.debug("REST request to get a page of user's Tickets");
    Page<Ticket> page;
    if (eagerload) {
        page = ticketRepository.findAllWithEagerRelationships(pageable);
    } else {
        page = new PageImpl<>(ticketRepository.findByAssignedToIsCurrentUser());
    }
    HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, String.format("/api/tickets/self?eagerload=%b", eagerload));
    return ResponseEntity.ok().headers(headers).body(page.getContent());
}
```

If you check the file <walkthrough-editor-open-file filePath="BugTrackerJHipster/src/main/java/com/mycompany/bugtracker/repository/TicketRepository.java" text="TicketRepository.java"></walkthrough-editor-open-file>, you will see that the method has been already implemented, that is why this time you don't need to modify anything.

With the previous code added, we've supplemented our API with a new mapping: to see if the endpoint works as intended, start up your application and log in as an admin.

Click on the **Administration** menu and then **API**. Show the **Ticket Resource** API and you should see that a GET /api/tickets/self has been added on the list.

Show the hidden contents by clicking on it and click on the **Try it out!** button. You will see that the server works fine and answers with a JSON.

## Securing our back-end

Right now, anyone can delete a ticket, even a normal user. We want to ensure that only an admin can delete a ticket.

JHipster is using [Spring Security](https://spring.io/projects/spring-security) to manage authentication and authorization in your application.

To ensure that only an admin can delete a ticket, head to the file <walkthrough-editor-open-file filePath="BugTrackerJHipster/src/main/java/com/mycompany/bugtracker/web/rest/TicketResource.java" text="TicketResource.java"></walkthrough-editor-open-file>  again and add the following annotation on the method `deleteTicket`:

```Java
@DeleteMapping("/tickets/{id}")
@Secured(AuthoritiesConstants.ADMIN)
public ResponseEntity<Void> deleteTicket(@PathVariable Long id) {
    ...
}
```

If you're using the google cloud shell to edit files, remember to add the import:

```Java
import org.springframework.security.access.annotation.Secured;
import com.mycompany.bugtracker.security.AuthoritiesConstants;
import io.swagger.annotations.ApiParam;
import org.springframework.data.domain.PageImpl;
```

And that's about it !

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

Congratulations ! You managed to create a new mapping for your server and improved the security of your application !

Enter the next command line to start the next tutorial:

```bash
cloudshell launch-tutorial -d ~/jhipster-guides/guides/06_editing_front.md;
```
