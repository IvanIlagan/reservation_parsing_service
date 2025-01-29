# README
## Prerequisites

Install the ff in their specific versions:
* Ruby version: 3.2.2
* Rails version: 7.1.5.1
* PostgreSQL version: 14.12

## How To Run The Server
run the commands
```bash
bundle install
rails db:create
rails db:migrate
rails s -p <port_number>
```
## How To Run Tests
run the command `bundle exec rspec .`

## API
Check out API details at [API_DOCS](./API_DOCS.md)