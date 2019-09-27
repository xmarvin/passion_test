It's a simple app, which demonstrates how react works together with RoR API.

What was implemented:
  - API endpoints /verticals, /categories, /courses
  - Login with facebook
  - Added react, list view on root page demonstrate API usage


>How does your solution perform?
>How does your solution scale?
  I kept my endpoints simple for that reason. No joins, no subselects. SQL queries are very simple. It suppose to perform very well.
  It will scale well, it's possible to easy add sharding if needed.

>What would you improve next?
 I'd add GraphQL to let client's interface be more flexible