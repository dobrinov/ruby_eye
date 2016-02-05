# Ruby Eye
Monitoring & alerting for monolith and distributed systems.

## Installation
##### Development
1. Make sure that you have a system with PostgreSQL and Ruby
2. Clone the project
3. Migrate the database
4. `bundle exec rake measurements:server` - to start the measurements server.
5. `bundle exec rails s` - to start the web applicaiton

##### Production
1. Use the Capistrano deployment script.
