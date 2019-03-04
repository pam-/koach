# KOACH

![demo](betterup.gif)

Koach is a platform where users can book appointments with coaches.
When a user visits Koach, they can see all available time slots divided in 30 minutes increments.
They can book the time(s) that fit their schedule.

## Local Setup
**This app uses [Docker](https://www.docker.com/get-started) to run. Please ensure that you have it installed.**

- Build the container
`docker-compose build`

- Setup the database
`docker-compose run app --rm rake db:setup`

- Run the app
`docker-compose up`

- Visit the app at [localhost:3000](localhost:3000)!

-----------------

## What I would add / do diffrently
- responsiveness
- not use all the latest versions of everything in the setup because I ran into all the issues (good learning experience!)
- partials (felt a bit rushed because ~ life ~)
- error handling
- **tests**
- accessibility
- use vue
- add auth
- add user's booked appointments
- add confirmation option for coaches
