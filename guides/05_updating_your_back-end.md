# 05. Updating your back-end

<walkthrough-tutorial-duration duration="10"></walkthrough-tutorial-duration>

## Ordered tickets

Right now, our tickets are not ordered, unless you click on the column header to sort them manually. We want to change that as we want to have the most urgent tickets on top of the list.

First, head to the `TicketRepository.java` file in the back end part of your application and add the following method:

```Java
Page<Ticket> findAllByOrderByDueDateAsc();
```

Spring Data JPA will deduce its associated query by parsing the method name, that means you do not have to implement anything else.

Now, head to the `TicketResource.java` file and change the `getAllTickets` function so that it instead uses our new function.

```Java
@GetMapping("/tickets")
public ResponseEntity<List<Ticket>> getAllTickets(Pageable pageable, @RequestParam(required = false, defaultValue = "false") boolean eagerload) {
    log.debug("REST request to get a page of Tickets");
    Page<Ticket> page;
    if (eagerload) {
        page = ticketRepository.findAllWithEagerRelationships(pageable);
    } else {
        //page = ticketRepository.findAll(pageable);
        page = ticketRepository.findAllByOrderByDueDateAsc();
    }
    HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, String.format("/api/tickets?eagerload=%b", eagerload));
    return ResponseEntity.ok().headers(headers).body(page.getContent());
}
```

If you start your server again, you should see that the tickets are automatically ordered by the due date.

## Assigned tickets

Let's now add up a new API to our server: you want to show your end users their assigned tickets. For that, let's start with creating a new mapping, add this to the `TicketResource.java` file:

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

If you check in the `TicketRepository.java` file, you will see that the method has been already implemented, that is why this time you didn't to modify anything in that file.

With the previous code added, we've supplemented our API with a new mapping: to see if the endpoint works as intended, start up your application and log in as an admin.

Click on the **Administration** menu and then **API**. Show the **Ticket Resource** API and you should see that a GET /api/tickets/self has been added on the list.

Show the hidden contents by clicking on it and click on the **Try it out!** button. You will see that the server works fine and answers with a JSON.

## Securing our back-end

Right now, anyone can delete a ticket, even a normal user. We want to ensure that only an admin can delete a ticket.

JHipster is using 