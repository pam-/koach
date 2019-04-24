# KOACH

![demo](gif.gif)

Koach is a platform where users can book appointments with coaches.
When a user visits Koach, they can see all available time slots divided in 30 minutes increments.
They can book the time(s) that fit their schedule.

## Stack
- Rails
- Vue.js**
- MySQL
- Docker

## Local Setup
**This app uses [Docker](https://www.docker.com/get-started) to run. Please ensure that you have it installed.**

- Build the container
`docker-compose build`

- Setup the database
`docker-compose run --rm app rake db:setup`

- Run the app
`docker-compose up`

- To run tests
`docker-compose run --rm app rspec`

- Visit the app at [localhost:3000](localhost:3000)!
