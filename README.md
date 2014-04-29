Beer Menu Maker
========
~Joey Bachand

User Stories
---
+ Beers must be able to be searched by names and return a list of results.
+ Beers should be able to be added to the menu from the search results.
+ Along with the beer name, the alchol content, description, and an image of the beer should be displayed if available.
+ A user must be signed in to be able to add a beer to the menu.
+ A user must have the appropriate email domain to register.
+ A new user must be emailed when creating a new account.

Estimation
---
+ Beer search - 3 days
+ Beer add - 2 days
+ Display beer information - 2 days
+ Create user login process - 4 days
+ Send users emails - 2 days
+ **Total Time - 13 days**
+ **Total Time with Velocity - 17 days**

Assumptions
--
The app will be set up for each indivdual restaurant with the email domain differing for each particular setup. A restaurant must have its own email domain for this setup to work.

Big Story Resolution
--
An smtp server is needed to send the emails. I had to setup a gmail account to send the emails through.
